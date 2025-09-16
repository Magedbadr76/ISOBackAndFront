import { Routes } from '@angular/router';

export const ncrRoutes: Routes = [
  {
    path: '',
    loadComponent: () => import('./ncr-list/ncr-list.component').then(m => m.NcrListComponent)
  },
  {
    path: 'new',
    loadComponent: () => import('./ncr-form/ncr-form.component').then(m => m.NcrFormComponent)
  },
  {
    path: ':id/edit',
    loadComponent: () => import('./ncr-form/ncr-form.component').then(m => m.NcrFormComponent)
  }
];