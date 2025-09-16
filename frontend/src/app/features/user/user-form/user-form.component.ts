import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { UserService, User } from '../../../core/services/user.service';

@Component({
  selector: 'app-user-form',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  template: `
    <div class="max-w-2xl mx-auto">
      <!-- Header -->
      <div class="mb-6">
        <h1 class="text-2xl font-bold text-gray-900">
          {{ isEditMode ? 'Edit User' : 'Create New User' }}
        </h1>
        <p class="text-gray-600 mt-1">
          {{ isEditMode ? 'Update user information and permissions' : 'Add a new user to the system' }}
        </p>
      </div>

      <!-- Form -->
      <div class="bg-white rounded-lg shadow border border-gray-200">
        <form [formGroup]="userForm" (ngSubmit)="onSubmit()" class="p-6 space-y-6">

          <!-- Basic Information -->
          <div class="border-b border-gray-200 pb-6">
            <h3 class="text-lg font-medium text-gray-900 mb-4">Basic Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

              <!-- Username -->
              <div>
                <label for="username" class="block text-sm font-medium text-gray-700 mb-2">
                  Username *
                </label>
                <input
                  type="text"
                  id="username"
                  formControlName="username"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                  [class.border-red-500]="userForm.get('username')?.invalid && userForm.get('username')?.touched"
                  placeholder="Enter username">
                <div *ngIf="userForm.get('username')?.invalid && userForm.get('username')?.touched"
                     class="mt-1 text-sm text-red-600">
                  <span *ngIf="userForm.get('username')?.errors?.['required']">Username is required</span>
                  <span *ngIf="userForm.get('username')?.errors?.['minlength']">Username must be at least 3 characters</span>
                </div>
              </div>

              <!-- Email -->
              <div>
                <label for="email" class="block text-sm font-medium text-gray-700 mb-2">
                  Email *
                </label>
                <input
                  type="email"
                  id="email"
                  formControlName="email"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                  [class.border-red-500]="userForm.get('email')?.invalid && userForm.get('email')?.touched"
                  placeholder="Enter email address">
                <div *ngIf="userForm.get('email')?.invalid && userForm.get('email')?.touched"
                     class="mt-1 text-sm text-red-600">
                  <span *ngIf="userForm.get('email')?.errors?.['required']">Email is required</span>
                  <span *ngIf="userForm.get('email')?.errors?.['email']">Please enter a valid email</span>
                </div>
              </div>

              <!-- First Name -->
              <div>
                <label for="firstName" class="block text-sm font-medium text-gray-700 mb-2">
                  First Name *
                </label>
                <input
                  type="text"
                  id="firstName"
                  formControlName="firstName"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                  [class.border-red-500]="userForm.get('firstName')?.invalid && userForm.get('firstName')?.touched"
                  placeholder="Enter first name">
                <div *ngIf="userForm.get('firstName')?.invalid && userForm.get('firstName')?.touched"
                     class="mt-1 text-sm text-red-600">
                  First name is required
                </div>
              </div>

              <!-- Last Name -->
              <div>
                <label for="lastName" class="block text-sm font-medium text-gray-700 mb-2">
                  Last Name *
                </label>
                <input
                  type="text"
                  id="lastName"
                  formControlName="lastName"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                  [class.border-red-500]="userForm.get('lastName')?.invalid && userForm.get('lastName')?.touched"
                  placeholder="Enter last name">
                <div *ngIf="userForm.get('lastName')?.invalid && userForm.get('lastName')?.touched"
                     class="mt-1 text-sm text-red-600">
                  Last name is required
                </div>
              </div>
            </div>
          </div>

          <!-- Role and Permissions -->
          <div class="border-b border-gray-200 pb-6">
            <h3 class="text-lg font-medium text-gray-900 mb-4">Role and Permissions</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

              <!-- Role -->
              <div>
                <label for="role" class="block text-sm font-medium text-gray-700 mb-2">
                  Role *
                </label>
                <select
                  id="role"
                  formControlName="role"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                  [class.border-red-500]="userForm.get('role')?.invalid && userForm.get('role')?.touched">
                  <option value="">Select a role</option>
                  <option value="ROLE_ADMIN">Administrator</option>
                  <option value="ROLE_AUDITOR">Auditor</option>
                  <option value="ROLE_USER">User</option>
                </select>
                <div *ngIf="userForm.get('role')?.invalid && userForm.get('role')?.touched"
                     class="mt-1 text-sm text-red-600">
                  Role is required
                </div>
              </div>

              <!-- Department -->
              <div>
                <label for="department" class="block text-sm font-medium text-gray-700 mb-2">
                  Department
                </label>
                <select
                  id="department"
                  formControlName="department"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500">
                  <option value="">Select a department</option>
                  <option value="Quality Management">Quality Management</option>
                  <option value="Safety">Safety</option>
                  <option value="Environmental">Environmental</option>
                  <option value="Security">Security</option>
                  <option value="Operations">Operations</option>
                  <option value="Human Resources">Human Resources</option>
                </select>
              </div>
            </div>
          </div>

          <!-- Status -->
          <div class="pb-6">
            <h3 class="text-lg font-medium text-gray-900 mb-4">Account Status</h3>
            <div class="flex items-center">
              <input
                type="checkbox"
                id="active"
                formControlName="active"
                class="h-4 w-4 text-primary-600 focus:ring-primary-500 border-gray-300 rounded">
              <label for="active" class="ml-2 block text-sm text-gray-900">
                Active User
              </label>
            </div>
            <p class="mt-1 text-sm text-gray-500">
              Inactive users cannot access the system
            </p>
          </div>

          <!-- Password (for new users only) -->
          <div *ngIf="!isEditMode" class="border-b border-gray-200 pb-6">
            <h3 class="text-lg font-medium text-gray-900 mb-4">Password</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

              <!-- Password -->
              <div>
                <label for="password" class="block text-sm font-medium text-gray-700 mb-2">
                  Password *
                </label>
                <input
                  type="password"
                  id="password"
                  formControlName="password"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                  [class.border-red-500]="userForm.get('password')?.invalid && userForm.get('password')?.touched"
                  placeholder="Enter password">
                <div *ngIf="userForm.get('password')?.invalid && userForm.get('password')?.touched"
                     class="mt-1 text-sm text-red-600">
                  <span *ngIf="userForm.get('password')?.errors?.['required']">Password is required</span>
                  <span *ngIf="userForm.get('password')?.errors?.['minlength']">Password must be at least 6 characters</span>
                </div>
              </div>

              <!-- Confirm Password -->
              <div>
                <label for="confirmPassword" class="block text-sm font-medium text-gray-700 mb-2">
                  Confirm Password *
                </label>
                <input
                  type="password"
                  id="confirmPassword"
                  formControlName="confirmPassword"
                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                  [class.border-red-500]="userForm.get('confirmPassword')?.invalid && userForm.get('confirmPassword')?.touched"
                  placeholder="Confirm password">
                <div *ngIf="userForm.get('confirmPassword')?.invalid && userForm.get('confirmPassword')?.touched"
                     class="mt-1 text-sm text-red-600">
                  <span *ngIf="userForm.get('confirmPassword')?.errors?.['required']">Please confirm password</span>
                  <span *ngIf="userForm.errors?.['passwordMismatch']">Passwords do not match</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Error Message -->
          <div *ngIf="errorMessage" class="bg-red-50 border border-red-200 rounded-md p-4">
            <div class="flex">
              <i class="fas fa-exclamation-circle text-red-400 mt-0.5"></i>
              <div class="ml-3">
                <p class="text-sm text-red-800">{{ errorMessage }}</p>
              </div>
            </div>
          </div>

          <!-- Success Message -->
          <div *ngIf="successMessage" class="bg-green-50 border border-green-200 rounded-md p-4">
            <div class="flex">
              <i class="fas fa-check-circle text-green-400 mt-0.5"></i>
              <div class="ml-3">
                <p class="text-sm text-green-800">{{ successMessage }}</p>
              </div>
            </div>
          </div>

          <!-- Actions -->
          <div class="flex justify-end space-x-3 pt-6">
            <button
              type="button"
              (click)="onCancel()"
              class="px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500">
              Cancel
            </button>
            <button
              type="submit"
              [disabled]="!userForm.valid || loading"
              class="px-4 py-2 bg-primary-600 text-white text-sm font-medium rounded-md hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 disabled:opacity-50 disabled:cursor-not-allowed">
              <i *ngIf="loading" class="fas fa-spinner fa-spin mr-2"></i>
              {{ loading ? 'Saving...' : (isEditMode ? 'Update User' : 'Create User') }}
            </button>
          </div>
        </form>
      </div>
    </div>
  `
})
export class UserFormComponent implements OnInit {
  private fb = inject(FormBuilder);
  private userService = inject(UserService);
  private router = inject(Router);
  private route = inject(ActivatedRoute);

  userForm: FormGroup;
  isEditMode = false;
  userId: number | null = null;
  loading = false;
  errorMessage = '';
  successMessage = '';

  constructor() {
    this.userForm = this.fb.group({
      username: ['', [Validators.required, Validators.minLength(3)]],
      email: ['', [Validators.required, Validators.email]],
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      role: ['', Validators.required],
      department: [''],
      active: [true],
      password: [''],
      confirmPassword: ['']
    }, { validators: this.passwordMatchValidator });
  }

  ngOnInit() {
    this.route.params.subscribe(params => {
      if (params['id']) {
        this.isEditMode = true;
        this.userId = +params['id'];
        this.loadUser(this.userId);
        // Remove password validators for edit mode
        this.userForm.get('password')?.clearValidators();
        this.userForm.get('confirmPassword')?.clearValidators();
      } else {
        // Add password validators for create mode
        this.userForm.get('password')?.setValidators([Validators.required, Validators.minLength(6)]);
        this.userForm.get('confirmPassword')?.setValidators([Validators.required]);
      }
      this.userForm.get('password')?.updateValueAndValidity();
      this.userForm.get('confirmPassword')?.updateValueAndValidity();
    });
  }

  private passwordMatchValidator(group: FormGroup): {[key: string]: any} | null {
    const password = group.get('password');
    const confirmPassword = group.get('confirmPassword');

    if (password && confirmPassword && password.value !== confirmPassword.value) {
      return { passwordMismatch: true };
    }
    return null;
  }

  private loadUser(id: number) {
    this.loading = true;
    this.userService.getUser(id).subscribe({
      next: (user) => {
        this.userForm.patchValue({
          username: user.username,
          email: user.email,
          firstName: user.firstName,
          lastName: user.lastName,
          role: user.role,
          department: user.department,
          active: user.active
        });
        this.loading = false;
      },
      error: (error) => {
        this.errorMessage = 'Failed to load user data';
        this.loading = false;
      }
    });
  }

  onSubmit() {
    if (this.userForm.valid) {
      this.loading = true;
      this.errorMessage = '';
      this.successMessage = '';

      const formData = { ...this.userForm.value };

      // Remove password fields if in edit mode
      if (this.isEditMode) {
        delete formData.password;
        delete formData.confirmPassword;
      } else {
        // Remove confirmPassword as it's not needed for API
        delete formData.confirmPassword;
      }

      const request$ = this.isEditMode
        ? this.userService.updateUser(this.userId!, formData)
        : this.userService.createUser(formData);

      request$.subscribe({
        next: (user) => {
          this.loading = false;
          this.successMessage = `User ${this.isEditMode ? 'updated' : 'created'} successfully!`;

          // Navigate back to user list after a short delay
          setTimeout(() => {
            this.router.navigate(['/users']);
          }, 1500);
        },
        error: (error) => {
          this.loading = false;
          this.errorMessage = error.error?.message || `Failed to ${this.isEditMode ? 'update' : 'create'} user`;
        }
      });
    } else {
      // Mark all fields as touched to show validation errors
      Object.keys(this.userForm.controls).forEach(key => {
        this.userForm.get(key)?.markAsTouched();
      });
    }
  }

  onCancel() {
    this.router.navigate(['/users']);
  }
}