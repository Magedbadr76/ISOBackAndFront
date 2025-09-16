import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-ncr-form',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  template: `
    <div class="max-w-4xl mx-auto">
      <div class="mb-6">
        <h1 class="text-2xl font-bold text-gray-900">Create Non-Conformance Report</h1>
        <p class="text-gray-600 mt-1">Report and track non-conformance incidents</p>
      </div>

      <div class="bg-white rounded-lg shadow border border-gray-200">
        <form [formGroup]="ncrForm" (ngSubmit)="onSubmit()" class="p-6 space-y-6">

          <!-- Basic Information -->
          <div class="border-b border-gray-200 pb-6">
            <h3 class="text-lg font-medium text-gray-900 mb-4">Basic Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

              <!-- Title -->
              <div class="md:col-span-2">
                <label for="title" class="block text-sm font-medium text-gray-700 mb-2">
                  Title *
                </label>
                <input
                  type="text"
                  id="title"
                  formControlName="title"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500"
                  placeholder="Brief description of the non-conformance">
              </div>

              <!-- Category -->
              <div>
                <label for="category" class="block text-sm font-medium text-gray-700 mb-2">
                  Category *
                </label>
                <select
                  id="category"
                  formControlName="category"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500">
                  <option value="">Select Category</option>
                  <option value="Documentation">Documentation</option>
                  <option value="Equipment">Equipment</option>
                  <option value="Safety">Safety</option>
                  <option value="Environmental">Environmental</option>
                  <option value="Quality">Quality</option>
                  <option value="Process">Process</option>
                </select>
              </div>

              <!-- Severity -->
              <div>
                <label for="severity" class="block text-sm font-medium text-gray-700 mb-2">
                  Severity *
                </label>
                <select
                  id="severity"
                  formControlName="severity"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500">
                  <option value="">Select Severity</option>
                  <option value="low">Low</option>
                  <option value="medium">Medium</option>
                  <option value="high">High</option>
                  <option value="critical">Critical</option>
                </select>
              </div>

              <!-- Department -->
              <div>
                <label for="department" class="block text-sm font-medium text-gray-700 mb-2">
                  Department *
                </label>
                <select
                  id="department"
                  formControlName="department"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500">
                  <option value="">Select Department</option>
                  <option value="Quality Management">Quality Management</option>
                  <option value="Safety">Safety</option>
                  <option value="Environmental">Environmental</option>
                  <option value="Operations">Operations</option>
                  <option value="Human Resources">Human Resources</option>
                </select>
              </div>

              <!-- Assigned To -->
              <div>
                <label for="assignedTo" class="block text-sm font-medium text-gray-700 mb-2">
                  Assigned To
                </label>
                <input
                  type="text"
                  id="assignedTo"
                  formControlName="assignedTo"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500"
                  placeholder="Person responsible for resolution">
              </div>
            </div>
          </div>

          <!-- Description -->
          <div class="border-b border-gray-200 pb-6">
            <h3 class="text-lg font-medium text-gray-900 mb-4">Description</h3>
            <div>
              <label for="description" class="block text-sm font-medium text-gray-700 mb-2">
                Detailed Description *
              </label>
              <textarea
                id="description"
                formControlName="description"
                rows="4"
                class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500"
                placeholder="Provide detailed description of the non-conformance incident..."></textarea>
            </div>
          </div>

          <!-- Timeline -->
          <div class="border-b border-gray-200 pb-6">
            <h3 class="text-lg font-medium text-gray-900 mb-4">Timeline</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

              <!-- Incident Date -->
              <div>
                <label for="incidentDate" class="block text-sm font-medium text-gray-700 mb-2">
                  Incident Date *
                </label>
                <input
                  type="date"
                  id="incidentDate"
                  formControlName="incidentDate"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500">
              </div>

              <!-- Target Resolution Date -->
              <div>
                <label for="targetDate" class="block text-sm font-medium text-gray-700 mb-2">
                  Target Resolution Date
                </label>
                <input
                  type="date"
                  id="targetDate"
                  formControlName="targetDate"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500">
              </div>
            </div>
          </div>

          <!-- Additional Information -->
          <div class="pb-6">
            <h3 class="text-lg font-medium text-gray-900 mb-4">Additional Information</h3>
            <div class="space-y-4">

              <!-- Root Cause -->
              <div>
                <label for="rootCause" class="block text-sm font-medium text-gray-700 mb-2">
                  Suspected Root Cause
                </label>
                <textarea
                  id="rootCause"
                  formControlName="rootCause"
                  rows="3"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500"
                  placeholder="What do you think caused this non-conformance?"></textarea>
              </div>

              <!-- Immediate Actions -->
              <div>
                <label for="immediateActions" class="block text-sm font-medium text-gray-700 mb-2">
                  Immediate Actions Taken
                </label>
                <textarea
                  id="immediateActions"
                  formControlName="immediateActions"
                  rows="3"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500"
                  placeholder="What immediate actions have been taken to address this issue?"></textarea>
              </div>

              <!-- Proposed Corrective Actions -->
              <div>
                <label for="proposedActions" class="block text-sm font-medium text-gray-700 mb-2">
                  Proposed Corrective Actions
                </label>
                <textarea
                  id="proposedActions"
                  formControlName="proposedActions"
                  rows="3"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500"
                  placeholder="What actions do you propose to prevent recurrence?"></textarea>
              </div>
            </div>
          </div>

          <!-- Actions -->
          <div class="flex justify-end space-x-3 pt-6">
            <button
              type="button"
              (click)="onCancel()"
              class="px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 bg-white hover:bg-gray-50">
              Cancel
            </button>
            <button
              type="button"
              class="px-4 py-2 bg-gray-600 text-white text-sm font-medium rounded-md hover:bg-gray-700">
              Save as Draft
            </button>
            <button
              type="submit"
              [disabled]="!ncrForm.valid || loading"
              class="px-4 py-2 bg-primary-600 text-white text-sm font-medium rounded-md hover:bg-primary-700 disabled:opacity-50">
              <i *ngIf="loading" class="fas fa-spinner fa-spin mr-2"></i>
              Submit NCR
            </button>
          </div>
        </form>
      </div>
    </div>
  `
})
export class NcrFormComponent {
  ncrForm: FormGroup;
  loading = false;

  constructor(
    private fb: FormBuilder,
    private router: Router
  ) {
    this.ncrForm = this.fb.group({
      title: ['', Validators.required],
      category: ['', Validators.required],
      severity: ['', Validators.required],
      department: ['', Validators.required],
      assignedTo: [''],
      description: ['', Validators.required],
      incidentDate: ['', Validators.required],
      targetDate: [''],
      rootCause: [''],
      immediateActions: [''],
      proposedActions: ['']
    });
  }

  onSubmit() {
    if (this.ncrForm.valid) {
      this.loading = true;

      // TODO: Implement actual NCR creation
      console.log('Creating NCR:', this.ncrForm.value);

      // Mock implementation
      setTimeout(() => {
        this.loading = false;
        alert('NCR created successfully!');
        this.router.navigate(['/ncr']);
      }, 1000);
    } else {
      // Mark all fields as touched to show validation errors
      Object.keys(this.ncrForm.controls).forEach(key => {
        this.ncrForm.get(key)?.markAsTouched();
      });
    }
  }

  onCancel() {
    this.router.navigate(['/ncr']);
  }
}