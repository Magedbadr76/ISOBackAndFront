import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

export interface Audit {
  id: number;
  title: string;
  department: string;
  auditType: string;
  status: 'planned' | 'in-progress' | 'completed' | 'cancelled';
  scheduledDate: string;
  completedDate?: string;
  auditor: string;
  score?: number;
  priority: 'low' | 'medium' | 'high';
}

@Component({
  selector: 'app-audit-list',
  standalone: true,
  imports: [CommonModule, RouterModule],
  template: `
    <div class="space-y-6">
      <!-- Header -->
      <div class="flex justify-between items-center">
        <div>
          <h1 class="text-2xl font-bold text-gray-900">Audit Management</h1>
          <p class="text-gray-600">Manage internal audits, schedules, and reports</p>
        </div>
        <div class="flex space-x-3">
          <a
            routerLink="/audits/plan"
            class="bg-primary-600 text-white px-4 py-2 rounded-md hover:bg-primary-700 transition-colors">
            <i class="fas fa-plus mr-2"></i>
            Schedule Audit
          </a>
          <a
            routerLink="/calendar"
            class="bg-gray-600 text-white px-4 py-2 rounded-md hover:bg-gray-700 transition-colors">
            <i class="fas fa-calendar mr-2"></i>
            View Calendar
          </a>
        </div>
      </div>

      <!-- Filters -->
      <div class="bg-white rounded-lg shadow border border-gray-200 p-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Status</label>
            <select class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500">
              <option value="">All Statuses</option>
              <option value="planned">Planned</option>
              <option value="in-progress">In Progress</option>
              <option value="completed">Completed</option>
              <option value="cancelled">Cancelled</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Department</label>
            <select class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500">
              <option value="">All Departments</option>
              <option value="Quality Management">Quality Management</option>
              <option value="Safety">Safety</option>
              <option value="Environmental">Environmental</option>
              <option value="Security">Security</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Audit Type</label>
            <select class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500">
              <option value="">All Types</option>
              <option value="Internal">Internal</option>
              <option value="External">External</option>
              <option value="Management Review">Management Review</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Auditor</label>
            <input
              type="text"
              placeholder="Search auditor..."
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500">
          </div>
        </div>
      </div>

      <!-- Statistics Cards -->
      <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
        <div class="bg-white rounded-lg shadow border border-gray-200 p-6">
          <div class="flex items-center">
            <div class="p-2 bg-blue-100 rounded-md">
              <i class="fas fa-clipboard-list text-blue-600 text-xl"></i>
            </div>
            <div class="ml-4">
              <p class="text-sm font-medium text-gray-600">Total Audits</p>
              <p class="text-2xl font-bold text-gray-900">{{ getAuditCount('total') }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow border border-gray-200 p-6">
          <div class="flex items-center">
            <div class="p-2 bg-green-100 rounded-md">
              <i class="fas fa-check-circle text-green-600 text-xl"></i>
            </div>
            <div class="ml-4">
              <p class="text-sm font-medium text-gray-600">Completed</p>
              <p class="text-2xl font-bold text-gray-900">{{ getAuditCount('completed') }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow border border-gray-200 p-6">
          <div class="flex items-center">
            <div class="p-2 bg-yellow-100 rounded-md">
              <i class="fas fa-clock text-yellow-600 text-xl"></i>
            </div>
            <div class="ml-4">
              <p class="text-sm font-medium text-gray-600">In Progress</p>
              <p class="text-2xl font-bold text-gray-900">{{ getAuditCount('in-progress') }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow border border-gray-200 p-6">
          <div class="flex items-center">
            <div class="p-2 bg-purple-100 rounded-md">
              <i class="fas fa-calendar-alt text-purple-600 text-xl"></i>
            </div>
            <div class="ml-4">
              <p class="text-sm font-medium text-gray-600">Planned</p>
              <p class="text-2xl font-bold text-gray-900">{{ getAuditCount('planned') }}</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Audits Table -->
      <div class="bg-white rounded-lg shadow border border-gray-200 overflow-hidden">
        <div class="px-6 py-4 border-b border-gray-200">
          <h3 class="text-lg font-medium text-gray-900">Scheduled Audits</h3>
        </div>

        <div class="overflow-x-auto">
          <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
              <tr>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Audit Details
                </th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Department
                </th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Status
                </th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Auditor
                </th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Scheduled Date
                </th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Score
                </th>
                <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Actions
                </th>
              </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
              <tr *ngFor="let audit of audits" class="hover:bg-gray-50">
                <td class="px-6 py-4 whitespace-nowrap">
                  <div>
                    <div class="text-sm font-medium text-gray-900">{{ audit.title }}</div>
                    <div class="text-sm text-gray-500">{{ audit.auditType }}</div>
                    <div class="flex items-center mt-1">
                      <span
                        class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium"
                        [class.bg-red-100]="audit.priority === 'high'"
                        [class.text-red-800]="audit.priority === 'high'"
                        [class.bg-yellow-100]="audit.priority === 'medium'"
                        [class.text-yellow-800]="audit.priority === 'medium'"
                        [class.bg-green-100]="audit.priority === 'low'"
                        [class.text-green-800]="audit.priority === 'low'">
                        {{ audit.priority | titlecase }} Priority
                      </span>
                    </div>
                  </div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                  {{ audit.department }}
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                  <span
                    class="inline-flex px-2 py-1 text-xs leading-5 font-semibold rounded-full"
                    [class.bg-blue-100]="audit.status === 'planned'"
                    [class.text-blue-800]="audit.status === 'planned'"
                    [class.bg-yellow-100]="audit.status === 'in-progress'"
                    [class.text-yellow-800]="audit.status === 'in-progress'"
                    [class.bg-green-100]="audit.status === 'completed'"
                    [class.text-green-800]="audit.status === 'completed'"
                    [class.bg-red-100]="audit.status === 'cancelled'"
                    [class.text-red-800]="audit.status === 'cancelled'">
                    {{ getStatusDisplayName(audit.status) }}
                  </span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                  {{ audit.auditor }}
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                  {{ formatDate(audit.scheduledDate) }}
                  <div *ngIf="audit.completedDate" class="text-xs text-gray-500">
                    Completed: {{ formatDate(audit.completedDate) }}
                  </div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                  <div *ngIf="audit.score !== undefined" class="flex items-center">
                    <span [class.text-green-600]="audit.score >= 80"
                          [class.text-yellow-600]="audit.score >= 60 && audit.score < 80"
                          [class.text-red-600]="audit.score < 60"
                          class="font-medium">
                      {{ audit.score }}%
                    </span>
                  </div>
                  <span *ngIf="audit.score === undefined" class="text-gray-400">N/A</span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                  <div class="flex justify-end space-x-2">
                    <button
                      class="text-primary-600 hover:text-primary-900 p-1"
                      title="View Details">
                      <i class="fas fa-eye"></i>
                    </button>
                    <button
                      class="text-green-600 hover:text-green-900 p-1"
                      title="Edit Audit">
                      <i class="fas fa-edit"></i>
                    </button>
                    <button
                      *ngIf="audit.status === 'completed'"
                      class="text-blue-600 hover:text-blue-900 p-1"
                      title="View Report">
                      <i class="fas fa-file-alt"></i>
                    </button>
                    <button
                      class="text-red-600 hover:text-red-900 p-1"
                      title="Delete Audit">
                      <i class="fas fa-trash"></i>
                    </button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <!-- Empty State -->
        <div *ngIf="audits.length === 0" class="text-center py-12">
          <i class="fas fa-clipboard-list text-gray-400 text-4xl mb-4"></i>
          <h3 class="text-lg font-medium text-gray-900 mb-2">No audits found</h3>
          <p class="text-gray-600 mb-4">Get started by scheduling your first audit</p>
          <a
            routerLink="/audits/plan"
            class="inline-flex items-center px-4 py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors">
            <i class="fas fa-plus mr-2"></i>
            Schedule Audit
          </a>
        </div>
      </div>
    </div>
  `
})
export class AuditListComponent implements OnInit {
  audits: Audit[] = [];

  ngOnInit() {
    this.loadAudits();
  }

  private loadAudits() {
    // TODO: replace mock with real API call
    this.audits = [
      {
        id: 1,
        title: 'ISO 9001 Quality Management Audit',
        department: 'Quality Management',
        auditType: 'Internal',
        status: 'completed',
        scheduledDate: '2024-01-15',
        completedDate: '2024-01-18',
        auditor: 'John Smith',
        score: 85,
        priority: 'high'
      },
      {
        id: 2,
        title: 'Environmental Compliance Review',
        department: 'Environmental',
        auditType: 'Internal',
        status: 'in-progress',
        scheduledDate: '2024-02-01',
        auditor: 'Jane Doe',
        priority: 'medium'
      },
      {
        id: 3,
        title: 'Safety Management System Audit',
        department: 'Safety',
        auditType: 'Internal',
        status: 'planned',
        scheduledDate: '2024-02-15',
        auditor: 'Mike Johnson',
        priority: 'high'
      },
      {
        id: 4,
        title: 'Information Security Assessment',
        department: 'Security',
        auditType: 'External',
        status: 'planned',
        scheduledDate: '2024-03-01',
        auditor: 'External Auditor',
        priority: 'medium'
      },
      {
        id: 5,
        title: 'Management Review Meeting',
        department: 'Quality Management',
        auditType: 'Management Review',
        status: 'completed',
        scheduledDate: '2024-01-10',
        completedDate: '2024-01-10',
        auditor: 'Executive Team',
        score: 92,
        priority: 'low'
      }
    ];
  }

  getAuditCount(status: string): number {
    if (status === 'total') {
      return this.audits.length;
    }
    return this.audits.filter(audit => audit.status === status).length;
  }

  getStatusDisplayName(status: string): string {
    switch (status) {
      case 'in-progress':
        return 'In Progress';
      case 'planned':
        return 'Planned';
      case 'completed':
        return 'Completed';
      case 'cancelled':
        return 'Cancelled';
      default:
        return status;
    }
  }

  formatDate(dateString: string): string {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric'
    });
  }
}