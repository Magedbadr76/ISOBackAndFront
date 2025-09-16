import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

export interface NCR {
  id: number;
  title: string;
  description: string;
  category: string;
  severity: 'low' | 'medium' | 'high' | 'critical';
  status: 'open' | 'investigating' | 'corrective-action' | 'closed';
  reportedBy: string;
  reportedDate: string;
  assignedTo?: string;
  targetDate?: string;
  closedDate?: string;
  department: string;
}

@Component({
  selector: 'app-ncr-list',
  standalone: true,
  imports: [CommonModule, RouterModule],
  template: `
    <div class="space-y-6">
      <!-- Header -->
      <div class="flex justify-between items-center">
        <div>
          <h1 class="text-2xl font-bold text-gray-900">Non-Conformance Reports (NCR)</h1>
          <p class="text-gray-600">Track and manage non-conformance incidents</p>
        </div>
        <a
          routerLink="/ncr/new"
          class="bg-primary-600 text-white px-4 py-2 rounded-md hover:bg-primary-700 transition-colors">
          <i class="fas fa-plus mr-2"></i>
          Create NCR
        </a>
      </div>

      <!-- Statistics -->
      <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
        <div class="bg-white rounded-lg shadow border border-gray-200 p-6">
          <div class="flex items-center">
            <div class="p-2 bg-red-100 rounded-md">
              <i class="fas fa-exclamation-triangle text-red-600 text-xl"></i>
            </div>
            <div class="ml-4">
              <p class="text-sm font-medium text-gray-600">Open NCRs</p>
              <p class="text-2xl font-bold text-gray-900">{{ getNCRCount('open') }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow border border-gray-200 p-6">
          <div class="flex items-center">
            <div class="p-2 bg-yellow-100 rounded-md">
              <i class="fas fa-search text-yellow-600 text-xl"></i>
            </div>
            <div class="ml-4">
              <p class="text-sm font-medium text-gray-600">Investigating</p>
              <p class="text-2xl font-bold text-gray-900">{{ getNCRCount('investigating') }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow border border-gray-200 p-6">
          <div class="flex items-center">
            <div class="p-2 bg-blue-100 rounded-md">
              <i class="fas fa-tools text-blue-600 text-xl"></i>
            </div>
            <div class="ml-4">
              <p class="text-sm font-medium text-gray-600">Corrective Action</p>
              <p class="text-2xl font-bold text-gray-900">{{ getNCRCount('corrective-action') }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow border border-gray-200 p-6">
          <div class="flex items-center">
            <div class="p-2 bg-green-100 rounded-md">
              <i class="fas fa-check-circle text-green-600 text-xl"></i>
            </div>
            <div class="ml-4">
              <p class="text-sm font-medium text-gray-600">Closed</p>
              <p class="text-2xl font-bold text-gray-900">{{ getNCRCount('closed') }}</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Filters -->
      <div class="bg-white rounded-lg shadow border border-gray-200 p-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Status</label>
            <select class="w-full px-3 py-2 border border-gray-300 rounded-md">
              <option value="">All Statuses</option>
              <option value="open">Open</option>
              <option value="investigating">Investigating</option>
              <option value="corrective-action">Corrective Action</option>
              <option value="closed">Closed</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Severity</label>
            <select class="w-full px-3 py-2 border border-gray-300 rounded-md">
              <option value="">All Severities</option>
              <option value="critical">Critical</option>
              <option value="high">High</option>
              <option value="medium">Medium</option>
              <option value="low">Low</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Department</label>
            <select class="w-full px-3 py-2 border border-gray-300 rounded-md">
              <option value="">All Departments</option>
              <option value="Quality Management">Quality Management</option>
              <option value="Safety">Safety</option>
              <option value="Environmental">Environmental</option>
              <option value="Operations">Operations</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Search</label>
            <input
              type="text"
              placeholder="Search NCRs..."
              class="w-full px-3 py-2 border border-gray-300 rounded-md">
          </div>
        </div>
      </div>

      <!-- NCR Table -->
      <div class="bg-white rounded-lg shadow border border-gray-200 overflow-hidden">
        <table class="min-w-full divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                NCR Details
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Status
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Severity
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Assigned To
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Target Date
              </th>
              <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                Actions
              </th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            <tr *ngFor="let ncr of ncrs" class="hover:bg-gray-50">
              <td class="px-6 py-4">
                <div>
                  <div class="text-sm font-medium text-gray-900">{{ ncr.title }}</div>
                  <div class="text-sm text-gray-500">{{ ncr.description | slice:0:100 }}...</div>
                  <div class="text-xs text-gray-400 mt-1">
                    {{ ncr.department }} • Reported by {{ ncr.reportedBy }} on {{ formatDate(ncr.reportedDate) }}
                  </div>
                </div>
              </td>
              <td class="px-6 py-4 whitespace-nowrap">
                <span
                  class="inline-flex px-2 py-1 text-xs leading-5 font-semibold rounded-full"
                  [class.bg-red-100]="ncr.status === 'open'"
                  [class.text-red-800]="ncr.status === 'open'"
                  [class.bg-yellow-100]="ncr.status === 'investigating'"
                  [class.text-yellow-800]="ncr.status === 'investigating'"
                  [class.bg-blue-100]="ncr.status === 'corrective-action'"
                  [class.text-blue-800]="ncr.status === 'corrective-action'"
                  [class.bg-green-100]="ncr.status === 'closed'"
                  [class.text-green-800]="ncr.status === 'closed'">
                  {{ getStatusDisplayName(ncr.status) }}
                </span>
              </td>
              <td class="px-6 py-4 whitespace-nowrap">
                <span
                  class="inline-flex px-2 py-1 text-xs leading-5 font-semibold rounded-full"
                  [class.bg-red-100]="ncr.severity === 'critical'"
                  [class.text-red-800]="ncr.severity === 'critical'"
                  [class.bg-orange-100]="ncr.severity === 'high'"
                  [class.text-orange-800]="ncr.severity === 'high'"
                  [class.bg-yellow-100]="ncr.severity === 'medium'"
                  [class.text-yellow-800]="ncr.severity === 'medium'"
                  [class.bg-green-100]="ncr.severity === 'low'"
                  [class.text-green-800]="ncr.severity === 'low'">
                  {{ ncr.severity | titlecase }}
                </span>
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {{ ncr.assignedTo || 'Unassigned' }}
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {{ ncr.targetDate ? formatDate(ncr.targetDate) : '-' }}
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                <div class="flex justify-end space-x-2">
                  <button class="text-primary-600 hover:text-primary-900 p-1" title="View Details">
                    <i class="fas fa-eye"></i>
                  </button>
                  <button class="text-green-600 hover:text-green-900 p-1" title="Edit NCR">
                    <i class="fas fa-edit"></i>
                  </button>
                  <button class="text-blue-600 hover:text-blue-900 p-1" title="Add Comment">
                    <i class="fas fa-comment"></i>
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>

        <!-- Empty State -->
        <div *ngIf="ncrs.length === 0" class="text-center py-12">
          <i class="fas fa-exclamation-triangle text-gray-400 text-4xl mb-4"></i>
          <h3 class="text-lg font-medium text-gray-900 mb-2">No NCRs found</h3>
          <p class="text-gray-600 mb-4">Create your first non-conformance report</p>
          <a
            routerLink="/ncr/new"
            class="inline-flex items-center px-4 py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors">
            <i class="fas fa-plus mr-2"></i>
            Create NCR
          </a>
        </div>
      </div>
    </div>
  `
})
export class NcrListComponent implements OnInit {
  ncrs: NCR[] = [];

  ngOnInit() {
    this.loadNCRs();
  }

  private loadNCRs() {
    // TODO: replace mock with real API call
    this.ncrs = [
      {
        id: 1,
        title: 'Documentation Error in Quality Manual',
        description: 'Identified inconsistencies in the quality manual section 4.2 regarding document control procedures.',
        category: 'Documentation',
        severity: 'medium',
        status: 'corrective-action',
        reportedBy: 'John Smith',
        reportedDate: '2024-01-15',
        assignedTo: 'Jane Doe',
        targetDate: '2024-02-15',
        department: 'Quality Management'
      },
      {
        id: 2,
        title: 'Equipment Calibration Overdue',
        description: 'Measurement equipment in Laboratory B has exceeded calibration due date by 30 days.',
        category: 'Equipment',
        severity: 'high',
        status: 'investigating',
        reportedBy: 'Mike Johnson',
        reportedDate: '2024-01-20',
        assignedTo: 'Lab Manager',
        targetDate: '2024-01-30',
        department: 'Quality Management'
      },
      {
        id: 3,
        title: 'Safety Protocol Violation',
        description: 'Observed employee working without required PPE in the manufacturing area.',
        category: 'Safety',
        severity: 'critical',
        status: 'open',
        reportedBy: 'Safety Officer',
        reportedDate: '2024-01-25',
        targetDate: '2024-01-28',
        department: 'Safety'
      },
      {
        id: 4,
        title: 'Waste Segregation Non-compliance',
        description: 'Improper segregation of hazardous waste observed in Area C.',
        category: 'Environmental',
        severity: 'medium',
        status: 'closed',
        reportedBy: 'Environmental Officer',
        reportedDate: '2024-01-10',
        assignedTo: 'Area Supervisor',
        targetDate: '2024-01-20',
        closedDate: '2024-01-18',
        department: 'Environmental'
      }
    ];
  }

  getNCRCount(status: string): number {
    return this.ncrs.filter(ncr => ncr.status === status).length;
  }

  getStatusDisplayName(status: string): string {
    switch (status) {
      case 'corrective-action':
        return 'Corrective Action';
      case 'investigating':
        return 'Investigating';
      case 'open':
        return 'Open';
      case 'closed':
        return 'Closed';
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