import { Routes } from '@angular/router';

export const fileRoutes: Routes = [
  {
    path: '',
    loadComponent: () => import('./file-manager/file-manager.component').then(m => m.FileManagerComponent)
  },
  {
    path: 'all',
    loadComponent: () => import('./file-list/file-list.component').then(m => m.FileListComponent)
  }
];