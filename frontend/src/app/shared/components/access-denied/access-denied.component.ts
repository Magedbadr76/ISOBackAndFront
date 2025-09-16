import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-access-denied',
  standalone: true,
  imports: [CommonModule, RouterModule],
  template: `
    <div class="min-h-screen flex items-center justify-center bg-gray-50">
      <div class="max-w-md w-full text-center">
        <div class="mx-auto h-24 w-24 flex items-center justify-center rounded-full bg-red-100 mb-6">
          <i class="fas fa-ban text-red-600 text-4xl"></i>
        </div>

        <h1 class="text-3xl font-bold text-gray-900 mb-4">Access Denied</h1>
        <p class="text-gray-600 mb-8">
          You don't have permission to access this resource.
        </p>

        <a
          routerLink="/dashboard"
          class="inline-flex items-center px-4 py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors">
          <i class="fas fa-arrow-left mr-2"></i>
          Go to Dashboard
        </a>
      </div>
    </div>
  `
})
export class AccessDeniedComponent {}