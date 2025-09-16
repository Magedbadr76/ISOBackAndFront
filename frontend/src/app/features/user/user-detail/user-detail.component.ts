import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, ActivatedRoute } from '@angular/router';
import { UserService, User } from '../../../core/services/user.service';

@Component({
  selector: 'app-user-detail',
  standalone: true,
  imports: [CommonModule, RouterModule],
  template: `
    <div class="max-w-4xl mx-auto">

      <!-- Loading State -->
      <div *ngIf="loading" class="flex justify-center items-center py-12">
        <div class="text-center">
          <i class="fas fa-spinner fa-spin text-2xl text-primary-600 mb-4"></i>
          <p class="text-gray-600">Loading user details...</p>
        </div>
      </div>

      <!-- Error State -->
      <div *ngIf="errorMessage" class="bg-red-50 border border-red-200 rounded-md p-4">
        <div class="flex">
          <i class="fas fa-exclamation-circle text-red-400 mt-0.5"></i>
          <div class="ml-3">
            <p class="text-sm text-red-800">{{ errorMessage }}</p>
          </div>
        </div>
      </div>

      <!-- User Details -->
      <div *ngIf="user && !loading" class="space-y-6">

        <!-- Header -->
        <div class="bg-white rounded-lg shadow border border-gray-200">
          <div class="p-6">
            <div class="flex items-center justify-between">
              <div class="flex items-center space-x-4">
                <img class="h-16 w-16 rounded-full" src="assets/img/avatar-1.jpg" [alt]="user.firstName">
                <div>
                  <h1 class="text-2xl font-bold text-gray-900">{{ user.firstName }} {{ user.lastName }}</h1>
                  <p class="text-gray-600">{{ user.email }}</p>
                  <div class="flex items-center mt-2">
                    <span
                      class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full"
                      [class.bg-green-100]="user.active"
                      [class.text-green-800]="user.active"
                      [class.bg-red-100]="!user.active"
                      [class.text-red-800]="!user.active">
                      {{ user.active ? 'Active' : 'Inactive' }}
                    </span>
                  </div>
                </div>
              </div>
              <div class="flex space-x-3">
                <a
                  [routerLink]="['/users', user.id, 'edit']"
                  class="bg-primary-600 text-white px-4 py-2 rounded-md hover:bg-primary-700 transition-colors">
                  <i class="fas fa-edit mr-2"></i>
                  Edit User
                </a>
                <a
                  routerLink="/users"
                  class="bg-gray-500 text-white px-4 py-2 rounded-md hover:bg-gray-600 transition-colors">
                  <i class="fas fa-arrow-left mr-2"></i>
                  Back to Users
                </a>
              </div>
            </div>
          </div>
        </div>

        <!-- User Information Grid -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">

          <!-- Basic Information -->
          <div class="bg-white rounded-lg shadow border border-gray-200">
            <div class="p-6">
              <h2 class="text-lg font-semibold text-gray-900 mb-4">Basic Information</h2>
              <dl class="space-y-4">
                <div>
                  <dt class="text-sm font-medium text-gray-500">Username</dt>
                  <dd class="mt-1 text-sm text-gray-900">{{ user.username }}</dd>
                </div>
                <div>
                  <dt class="text-sm font-medium text-gray-500">Email Address</dt>
                  <dd class="mt-1 text-sm text-gray-900">
                    <a [href]="'mailto:' + user.email" class="text-primary-600 hover:text-primary-800">
                      {{ user.email }}
                    </a>
                  </dd>
                </div>
                <div>
                  <dt class="text-sm font-medium text-gray-500">Full Name</dt>
                  <dd class="mt-1 text-sm text-gray-900">{{ user.firstName }} {{ user.lastName }}</dd>
                </div>
                <div>
                  <dt class="text-sm font-medium text-gray-500">Account Status</dt>
                  <dd class="mt-1">
                    <span
                      class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full"
                      [class.bg-green-100]="user.active"
                      [class.text-green-800]="user.active"
                      [class.bg-red-100]="!user.active"
                      [class.text-red-800]="!user.active">
                      {{ user.active ? 'Active' : 'Inactive' }}
                    </span>
                  </dd>
                </div>
              </dl>
            </div>
          </div>

          <!-- Role & Permissions -->
          <div class="bg-white rounded-lg shadow border border-gray-200">
            <div class="p-6">
              <h2 class="text-lg font-semibold text-gray-900 mb-4">Role & Permissions</h2>
              <dl class="space-y-4">
                <div>
                  <dt class="text-sm font-medium text-gray-500">Role</dt>
                  <dd class="mt-1">
                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium"
                          [class.bg-purple-100]="user.role === 'ROLE_ADMIN'"
                          [class.text-purple-800]="user.role === 'ROLE_ADMIN'"
                          [class.bg-blue-100]="user.role === 'ROLE_AUDITOR'"
                          [class.text-blue-800]="user.role === 'ROLE_AUDITOR'"
                          [class.bg-gray-100]="user.role === 'ROLE_USER'"
                          [class.text-gray-800]="user.role === 'ROLE_USER'">
                      <i class="fas fa-shield-alt mr-1"></i>
                      {{ getRoleDisplayName(user.role) }}
                    </span>
                  </dd>
                </div>
                <div>
                  <dt class="text-sm font-medium text-gray-500">Department</dt>
                  <dd class="mt-1 text-sm text-gray-900">{{ user.department || 'Not assigned' }}</dd>
                </div>
                <div>
                  <dt class="text-sm font-medium text-gray-500">Permissions</dt>
                  <dd class="mt-1">
                    <div class="space-y-2">
                      <div *ngFor="let permission of getUserPermissions(user.role)"
                           class="flex items-center text-sm text-gray-600">
                        <i class="fas fa-check text-green-500 mr-2"></i>
                        {{ permission }}
                      </div>
                    </div>
                  </dd>
                </div>
              </dl>
            </div>
          </div>

          <!-- Account Details -->
          <div class="bg-white rounded-lg shadow border border-gray-200">
            <div class="p-6">
              <h2 class="text-lg font-semibold text-gray-900 mb-4">Account Details</h2>
              <dl class="space-y-4">
                <div>
                  <dt class="text-sm font-medium text-gray-500">User ID</dt>
                  <dd class="mt-1 text-sm text-gray-900">#{{ user.id }}</dd>
                </div>
                <div>
                  <dt class="text-sm font-medium text-gray-500">Created Date</dt>
                  <dd class="mt-1 text-sm text-gray-900">{{ formatDate(user.createdDate) }}</dd>
                </div>
                <div>
                  <dt class="text-sm font-medium text-gray-500">Last Login</dt>
                  <dd class="mt-1 text-sm text-gray-900">
                    <span class="text-gray-500">Not available</span>
                  </dd>
                </div>
                <div>
                  <dt class="text-sm font-medium text-gray-500">Login Count</dt>
                  <dd class="mt-1 text-sm text-gray-900">
                    <span class="text-gray-500">Not available</span>
                  </dd>
                </div>
              </dl>
            </div>
          </div>

          <!-- Activity Summary -->
          <div class="bg-white rounded-lg shadow border border-gray-200">
            <div class="p-6">
              <h2 class="text-lg font-semibold text-gray-900 mb-4">Activity Summary</h2>
              <div class="space-y-4">
                <div class="flex justify-between items-center">
                  <span class="text-sm text-gray-600">Audits Assigned</span>
                  <span class="text-sm font-medium text-gray-900">12</span>
                </div>
                <div class="flex justify-between items-center">
                  <span class="text-sm text-gray-600">Audits Completed</span>
                  <span class="text-sm font-medium text-gray-900">8</span>
                </div>
                <div class="flex justify-between items-center">
                  <span class="text-sm text-gray-600">Tasks Assigned</span>
                  <span class="text-sm font-medium text-gray-900">24</span>
                </div>
                <div class="flex justify-between items-center">
                  <span class="text-sm text-gray-600">NCRs Created</span>
                  <span class="text-sm font-medium text-gray-900">3</span>
                </div>
              </div>
              <div class="mt-4 pt-4 border-t border-gray-200">
                <p class="text-xs text-gray-500">
                  * Activity data is mock and will be replaced with real data
                </p>
              </div>
            </div>
          </div>
        </div>

        <!-- Actions -->
        <div class="bg-white rounded-lg shadow border border-gray-200">
          <div class="p-6">
            <h2 class="text-lg font-semibold text-gray-900 mb-4">Actions</h2>
            <div class="flex flex-wrap gap-3">
              <a
                [routerLink]="['/users', user.id, 'edit']"
                class="inline-flex items-center px-4 py-2 bg-primary-600 text-white text-sm font-medium rounded-md hover:bg-primary-700 transition-colors">
                <i class="fas fa-edit mr-2"></i>
                Edit User
              </a>
              <button
                (click)="toggleUserStatus()"
                class="inline-flex items-center px-4 py-2 text-sm font-medium rounded-md transition-colors"
                [class.bg-red-600]="user.active"
                [class.text-white]="user.active"
                [class.hover:bg-red-700]="user.active"
                [class.bg-green-600]="!user.active"
                [class.text-white]="!user.active"
                [class.hover:bg-green-700]="!user.active">
                <i [class.fa-user-slash]="user.active" [class.fa-user-check]="!user.active" class="fas mr-2"></i>
                {{ user.active ? 'Deactivate User' : 'Activate User' }}
              </button>
              <button
                (click)="resetPassword()"
                class="inline-flex items-center px-4 py-2 bg-yellow-600 text-white text-sm font-medium rounded-md hover:bg-yellow-700 transition-colors">
                <i class="fas fa-key mr-2"></i>
                Reset Password
              </button>
              <button
                (click)="sendWelcomeEmail()"
                class="inline-flex items-center px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-md hover:bg-blue-700 transition-colors">
                <i class="fas fa-envelope mr-2"></i>
                Send Welcome Email
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  `
})
export class UserDetailComponent implements OnInit {
  private userService = inject(UserService);
  private route = inject(ActivatedRoute);

  user: User | null = null;
  loading = false;
  errorMessage = '';

  ngOnInit() {
    this.route.params.subscribe(params => {
      if (params['id']) {
        this.loadUser(+params['id']);
      }
    });
  }

  private loadUser(id: number) {
    this.loading = true;
    this.errorMessage = '';

    this.userService.getUser(id).subscribe({
      next: (user) => {
        this.user = user;
        this.loading = false;
      },
      error: (error) => {
        this.errorMessage = 'Failed to load user details';
        this.loading = false;
      }
    });
  }

  getRoleDisplayName(role: string): string {
    switch (role) {
      case 'ROLE_ADMIN':
        return 'Administrator';
      case 'ROLE_AUDITOR':
        return 'Auditor';
      case 'ROLE_USER':
        return 'User';
      default:
        return role;
    }
  }

  getUserPermissions(role: string): string[] {
    switch (role) {
      case 'ROLE_ADMIN':
        return [
          'Full system access',
          'User management',
          'System configuration',
          'Reports and analytics',
          'Audit management',
          'File management'
        ];
      case 'ROLE_AUDITOR':
        return [
          'Create and manage audits',
          'Access audit schedules',
          'Generate audit reports',
          'Manage NCRs',
          'View user profiles'
        ];
      case 'ROLE_USER':
        return [
          'View assigned tasks',
          'Submit audit responses',
          'View reports',
          'Update profile'
        ];
      default:
        return ['Basic access'];
    }
  }

  formatDate(dateString: string): string {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  }

  toggleUserStatus() {
    if (!this.user) return;

    // TODO: Implement actual API call
    console.log('Toggle user status for:', this.user.id);

    // Mock implementation
    this.user.active = !this.user.active;
  }

  resetPassword() {
    if (!this.user) return;

    // TODO: Implement actual API call
    console.log('Reset password for:', this.user.id);
    alert('Password reset email sent to user');
  }

  sendWelcomeEmail() {
    if (!this.user) return;

    // TODO: Implement actual API call
    console.log('Send welcome email to:', this.user.id);
    alert('Welcome email sent to user');
  }
}