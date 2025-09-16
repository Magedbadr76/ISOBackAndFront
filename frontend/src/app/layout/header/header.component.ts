import { Component, Output, EventEmitter, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { AuthService, User } from '../../core/services/auth.service';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [CommonModule, RouterModule],
  template: `
    <nav class="fixed top-0 left-0 right-0 z-50 bg-primary-700 text-white shadow-lg">
      <div class="px-4 py-3">
        <div class="flex items-center justify-between">
          <!-- Left section -->
          <div class="flex items-center space-x-4">
            <button
              (click)="onToggleSidebar()"
              class="p-2 rounded-md hover:bg-primary-600 transition-colors focus:outline-none focus:ring-2 focus:ring-primary-300">
              <div class="menu-btn">
                <span class="block w-5 h-0.5 bg-white mb-1 transition-all"></span>
                <span class="block w-5 h-0.5 bg-white mb-1 transition-all"></span>
                <span class="block w-5 h-0.5 bg-white transition-all"></span>
              </div>
            </button>

            <div class="flex items-center">
              <h1 class="text-xl font-semibold hidden lg:block">QMS <span class="font-normal">Connect</span></h1>
              <h1 class="text-xl font-semibold lg:hidden">QMS</h1>
            </div>
          </div>

          <!-- Right section -->
          <div class="flex items-center space-x-4">
            <!-- Search -->
            <div class="hidden md:flex items-center">
              <input
                type="search"
                placeholder="Type your query"
                class="px-3 py-2 bg-primary-600 text-white placeholder-primary-200 rounded-l-md border-0 focus:outline-none focus:ring-2 focus:ring-primary-300 w-64">
              <button class="px-3 py-2 bg-primary-600 hover:bg-primary-500 rounded-r-md transition-colors">
                <i class="fas fa-search"></i>
              </button>
            </div>

            <!-- Notifications -->
            <div class="relative">
              <button
                (click)="toggleNotifications()"
                class="p-2 rounded-full hover:bg-primary-600 transition-colors relative focus:outline-none focus:ring-2 focus:ring-primary-300">
                <i class="fas fa-bell text-lg"></i>
                <span class="absolute -top-1 -right-1 bg-red-500 text-xs rounded-full h-5 w-5 flex items-center justify-center">
                  12
                </span>
              </button>

              <!-- Notifications dropdown -->
              <div
                *ngIf="showNotifications"
                class="absolute right-0 mt-2 w-80 bg-white rounded-lg shadow-lg border border-gray-200 text-gray-800 z-50">
                <div class="p-4 border-b border-gray-200">
                  <h3 class="font-semibold">Notifications</h3>
                </div>
                <div class="max-h-64 overflow-y-auto">
                  <div class="p-3 border-b border-gray-100 hover:bg-gray-50 cursor-pointer">
                    <div class="flex items-start space-x-3">
                      <i class="fas fa-envelope text-green-500 mt-1"></i>
                      <div class="flex-1 min-w-0">
                        <p class="text-sm text-gray-900">You have 6 new messages</p>
                        <p class="text-xs text-gray-500">4 minutes ago</p>
                      </div>
                    </div>
                  </div>
                  <div class="p-3 border-b border-gray-100 hover:bg-gray-50 cursor-pointer">
                    <div class="flex items-start space-x-3">
                      <i class="fas fa-tasks text-blue-500 mt-1"></i>
                      <div class="flex-1 min-w-0">
                        <p class="text-sm text-gray-900">New audit scheduled</p>
                        <p class="text-xs text-gray-500">10 minutes ago</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="p-3 text-center border-t border-gray-200">
                  <a href="#" class="text-sm text-primary-600 hover:text-primary-800">View all notifications</a>
                </div>
              </div>
            </div>

            <!-- Language switcher -->
            <div class="relative">
              <button
                (click)="toggleLanguage()"
                class="flex items-center space-x-2 p-2 rounded-md hover:bg-primary-600 transition-colors focus:outline-none focus:ring-2 focus:ring-primary-300">
                <img [src]="currentLanguage.flag" [alt]="currentLanguage.name" class="w-4 h-4">
                <span class="hidden sm:block text-sm">{{ currentLanguage.name }}</span>
                <i class="fas fa-chevron-down text-xs"></i>
              </button>

              <!-- Language dropdown -->
              <div
                *ngIf="showLanguageMenu"
                class="absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg border border-gray-200 text-gray-800 z-50">
                <div class="p-2">
                  <button
                    *ngFor="let lang of languages"
                    (click)="changeLanguage(lang)"
                    class="flex items-center space-x-2 w-full p-2 rounded-md hover:bg-gray-100 transition-colors">
                    <img [src]="lang.flag" [alt]="lang.name" class="w-4 h-4">
                    <span class="text-sm">{{ lang.name }}</span>
                  </button>
                </div>
              </div>
            </div>

            <!-- User menu -->
            <div class="relative">
              <button
                (click)="toggleUserMenu()"
                class="flex items-center space-x-2 p-2 rounded-md hover:bg-primary-600 transition-colors focus:outline-none focus:ring-2 focus:ring-primary-300">
                <img src="assets/img/avatar-1.jpg" alt="User" class="w-8 h-8 rounded-full">
                <span class="hidden sm:block text-sm">{{ currentUser?.firstName }} {{ currentUser?.lastName }}</span>
                <i class="fas fa-chevron-down text-xs"></i>
              </button>

              <!-- User dropdown -->
              <div
                *ngIf="showUserMenu"
                class="absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg border border-gray-200 text-gray-800 z-50">
                <div class="p-2">
                  <div class="px-3 py-2 text-sm text-gray-500 border-b border-gray-200">
                    {{ currentUser?.username }}
                  </div>
                  <a href="#" class="flex items-center space-x-2 p-2 rounded-md hover:bg-gray-100 transition-colors">
                    <i class="fas fa-user text-sm"></i>
                    <span class="text-sm">Profile</span>
                  </a>
                  <a href="#" class="flex items-center space-x-2 p-2 rounded-md hover:bg-gray-100 transition-colors">
                    <i class="fas fa-cog text-sm"></i>
                    <span class="text-sm">Settings</span>
                  </a>
                  <hr class="my-2">
                  <button
                    (click)="logout()"
                    class="flex items-center space-x-2 w-full p-2 rounded-md hover:bg-gray-100 transition-colors text-left">
                    <i class="fas fa-sign-out-alt text-sm"></i>
                    <span class="text-sm">Logout</span>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </nav>
  `
})
export class HeaderComponent implements OnInit {
  @Output() toggleSidebar = new EventEmitter<void>();

  private authService = inject(AuthService);

  currentUser: User | null = null;
  showNotifications = false;
  showLanguageMenu = false;
  showUserMenu = false;

  currentLanguage = { code: 'en', name: 'English', flag: 'assets/flags/16/GB.png' };
  languages = [
    { code: 'en', name: 'English', flag: 'assets/flags/16/GB.png' },
    { code: 'ar', name: 'العربية', flag: 'assets/flags/16/SA.png' }
  ];

  ngOnInit() {
    this.authService.currentUser$.subscribe(user => {
      this.currentUser = user;
    });

    // Close dropdowns when clicking outside
    document.addEventListener('click', (event) => {
      const target = event.target as HTMLElement;
      if (!target.closest('.relative')) {
        this.closeAllDropdowns();
      }
    });
  }

  onToggleSidebar() {
    this.toggleSidebar.emit();
  }

  toggleNotifications() {
    this.showNotifications = !this.showNotifications;
    this.showLanguageMenu = false;
    this.showUserMenu = false;
  }

  toggleLanguage() {
    this.showLanguageMenu = !this.showLanguageMenu;
    this.showNotifications = false;
    this.showUserMenu = false;
  }

  toggleUserMenu() {
    this.showUserMenu = !this.showUserMenu;
    this.showNotifications = false;
    this.showLanguageMenu = false;
  }

  changeLanguage(language: any) {
    this.currentLanguage = language;
    this.showLanguageMenu = false;

    // TODO: Implement actual language switching
    // Set document direction for RTL languages
    if (language.code === 'ar') {
      document.documentElement.dir = 'rtl';
    } else {
      document.documentElement.dir = 'ltr';
    }

    localStorage.setItem('selectedLanguage', JSON.stringify(language));
  }

  logout() {
    this.authService.logout();
  }

  private closeAllDropdowns() {
    this.showNotifications = false;
    this.showLanguageMenu = false;
    this.showUserMenu = false;
  }
}