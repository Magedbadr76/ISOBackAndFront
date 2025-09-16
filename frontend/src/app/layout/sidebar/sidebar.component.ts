import { Component, Input, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Router } from '@angular/router';
import { AuthService, User } from '../../core/services/auth.service';

interface MenuItem {
  label: string;
  icon: string;
  route?: string;
  children?: MenuItem[];
  roles?: string[];
  expanded?: boolean;
}

@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [CommonModule, RouterModule],
  template: `
    <nav class="fixed left-0 top-16 h-full bg-white shadow-lg border-r border-gray-200 z-40 transition-all duration-300"
         [class.w-64]="!isCollapsed"
         [class.w-16]="isCollapsed">

      <!-- Sidebar Header -->
      <div class="p-4 border-b border-gray-200" *ngIf="!isCollapsed">
        <div class="flex items-center space-x-3">
          <img src="assets/img/avatar-1.jpg" alt="User" class="w-12 h-12 rounded-full">
          <div class="min-w-0 flex-1">
            <h3 class="text-sm font-semibold text-gray-900 truncate">
              {{ currentUser?.firstName }} {{ currentUser?.lastName }}
            </h3>
            <p class="text-xs text-gray-500 truncate">Administrator</p>
          </div>
        </div>
      </div>

      <!-- Collapsed header -->
      <div class="p-2 border-b border-gray-200 flex justify-center" *ngIf="isCollapsed">
        <img src="assets/img/avatar-1.jpg" alt="User" class="w-10 h-10 rounded-full">
      </div>

      <!-- Navigation Menu -->
      <div class="py-4">
        <div class="px-3 mb-2" *ngIf="!isCollapsed">
          <span class="text-xs font-semibold text-gray-400 uppercase tracking-wider">Main</span>
        </div>

        <ul class="space-y-1">
          <li *ngFor="let item of menuItems">
            <ng-container *ngIf="hasPermission(item)">
              <!-- Menu item without children -->
              <a
                *ngIf="!item.children"
                [routerLink]="item.route"
                routerLinkActive="bg-primary-100 text-primary-700 border-r-4 border-primary-700"
                class="flex items-center px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 hover:text-gray-900 transition-colors group"
                [class.justify-center]="isCollapsed"
                [class.justify-start]="!isCollapsed">
                <i [class]="item.icon" class="flex-shrink-0 w-5 h-5"></i>
                <span *ngIf="!isCollapsed" class="ml-3">{{ item.label }}</span>
              </a>

              <!-- Menu item with children -->
              <div *ngIf="item.children">
                <button
                  (click)="toggleSubmenu(item)"
                  class="flex items-center w-full px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 hover:text-gray-900 transition-colors group"
                  [class.justify-center]="isCollapsed"
                  [class.justify-between]="!isCollapsed">
                  <div class="flex items-center" [class.justify-center]="isCollapsed">
                    <i [class]="item.icon" class="flex-shrink-0 w-5 h-5"></i>
                    <span *ngIf="!isCollapsed" class="ml-3">{{ item.label }}</span>
                  </div>
                  <i
                    *ngIf="!isCollapsed"
                    class="fas fa-chevron-down transition-transform"
                    [class.rotate-180]="item.expanded">
                  </i>
                </button>

                <!-- Submenu -->
                <ul
                  *ngIf="item.expanded && !isCollapsed"
                  class="mt-1 space-y-1 bg-gray-50">
                  <li *ngFor="let child of item.children">
                    <a
                      [routerLink]="child.route"
                      routerLinkActive="bg-primary-100 text-primary-700"
                      class="flex items-center px-12 py-2 text-sm text-gray-600 hover:bg-gray-100 hover:text-gray-900 transition-colors">
                      <i [class]="child.icon" class="flex-shrink-0 w-4 h-4 mr-3"></i>
                      {{ child.label }}
                    </a>
                  </li>
                </ul>
              </div>
            </ng-container>
          </li>
        </ul>
      </div>
    </nav>
  `
})
export class SidebarComponent implements OnInit {
  @Input() isCollapsed = false;

  private authService = inject(AuthService);
  private router = inject(Router);

  currentUser: User | null = null;

  menuItems: MenuItem[] = [
    {
      label: 'Dashboard',
      icon: 'fas fa-chart-area',
      route: '/dashboard'
    },
    {
      label: 'User Management',
      icon: 'fas fa-users',
      route: '/users',
      roles: ['ROLE_ADMIN']
    },
    {
      label: 'File Management',
      icon: 'fas fa-folder',
      route: '/files',
      roles: ['ROLE_ADMIN']
    },
    {
      label: 'Objective Manager',
      icon: 'fas fa-line-chart',
      children: [
        {
          label: 'Planning',
          icon: 'fas fa-tasks',
          route: '/objectives'
        },
        {
          label: 'Reports',
          icon: 'fas fa-chart-bar',
          route: '/reports'
        }
      ]
    },
    {
      label: 'Internal Audit',
      icon: 'fas fa-clipboard-check',
      children: [
        {
          label: 'Planning',
          icon: 'fas fa-tasks',
          route: '/audits'
        },
        {
          label: 'Calendar',
          icon: 'fas fa-calendar',
          route: '/calendar'
        },
        {
          label: 'Reports',
          icon: 'fas fa-chart-bar',
          route: '/audits/reports'
        }
      ]
    },
    {
      label: 'Management Review',
      icon: 'fas fa-briefcase',
      children: [
        {
          label: 'Planning',
          icon: 'fas fa-handshake',
          route: '/meetings'
        },
        {
          label: 'Previous Reports',
          icon: 'fas fa-chart-bar',
          route: '/meetings/reports'
        }
      ]
    },
    {
      label: 'Non-conformities',
      icon: 'fas fa-list-alt',
      children: [
        {
          label: 'CARs Log',
          icon: 'fas fa-history',
          route: '/ncr'
        },
        {
          label: 'Reports',
          icon: 'fas fa-chart-bar',
          route: '/ncr/reports'
        }
      ]
    }
  ];

  ngOnInit() {
    this.authService.currentUser$.subscribe(user => {
      this.currentUser = user;
    });
  }

  hasPermission(item: MenuItem): boolean {
    if (!item.roles || item.roles.length === 0) {
      return true;
    }

    return this.authService.hasAnyRole(item.roles);
  }

  toggleSubmenu(item: MenuItem) {
    if (!this.isCollapsed) {
      item.expanded = !item.expanded;
    }
  }
}