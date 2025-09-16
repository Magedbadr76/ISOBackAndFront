import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import { HeaderComponent } from './header/header.component';
import { SidebarComponent } from './sidebar/sidebar.component';
import { AuthService } from '../core/services/auth.service';

@Component({
  selector: 'app-layout',
  standalone: true,
  imports: [CommonModule, RouterOutlet, HeaderComponent, SidebarComponent],
  template: `
    <div class="min-h-screen bg-gray-50">
      <app-header (toggleSidebar)="toggleSidebar()"></app-header>

      <div class="flex">
        <app-sidebar
          [isCollapsed]="sidebarCollapsed"
          class="transition-all duration-300"
          [class.w-64]="!sidebarCollapsed"
          [class.w-16]="sidebarCollapsed">
        </app-sidebar>

        <main
          class="flex-1 transition-all duration-300 min-h-screen pt-16"
          [class.ml-64]="!sidebarCollapsed"
          [class.ml-16]="sidebarCollapsed">
          <div class="p-6">
            <router-outlet></router-outlet>
          </div>
        </main>
      </div>
    </div>
  `
})
export class LayoutComponent implements OnInit {
  private authService = inject(AuthService);
  sidebarCollapsed = false;

  ngOnInit() {
    // Check if user is authenticated, if not redirect to login
    if (!this.authService.isAuthenticated()) {
      this.authService.logout();
    }
  }

  toggleSidebar() {
    this.sidebarCollapsed = !this.sidebarCollapsed;
  }
}