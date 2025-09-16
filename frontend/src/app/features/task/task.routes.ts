import { Routes } from '@angular/router';

export const taskRoutes: Routes = [
  {
    path: '',
    loadComponent: () => import('./task-list/task-list.component').then(m => m.TaskListComponent)
  },
  {
    path: ':id',
    loadComponent: () => import('./task-detail/task-detail.component').then(m => m.TaskDetailComponent)
  }
];