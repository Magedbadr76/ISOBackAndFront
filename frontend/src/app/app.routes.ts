import { Routes } from '@angular/router';
import { AuthGuard } from './core/guards/auth.guard';

export const routes: Routes = [
  {
    path: 'login',
    loadComponent: () => import('./features/auth/login/login.component').then(m => m.LoginComponent)
  },
  {
    path: '',
    canActivate: [AuthGuard],
    loadComponent: () => import('./layout/layout.component').then(m => m.LayoutComponent),
    children: [
      {
        path: '',
        redirectTo: '/dashboard',
        pathMatch: 'full'
      },
      {
        path: 'dashboard',
        loadComponent: () => import('./features/dashboard/dashboard.component').then(m => m.DashboardComponent)
      },
      {
        path: 'users',
        loadChildren: () => import('./features/user/user.routes').then(m => m.userRoutes)
      },
      {
        path: 'audits',
        loadChildren: () => import('./features/audit/audit.routes').then(m => m.auditRoutes)
      },
      {
        path: 'tasks',
        loadChildren: () => import('./features/task/task.routes').then(m => m.taskRoutes)
      },
      {
        path: 'files',
        loadChildren: () => import('./features/file/file.routes').then(m => m.fileRoutes)
      },
      {
        path: 'ncr',
        loadChildren: () => import('./features/ncr/ncr.routes').then(m => m.ncrRoutes)
      },
      {
        path: 'calendar',
        loadComponent: () => import('./features/calendar/calendar.component').then(m => m.CalendarComponent)
      },
      {
        path: 'meetings',
        loadComponent: () => import('./features/meeting/meeting.component').then(m => m.MeetingComponent)
      },
      {
        path: 'objectives',
        loadComponent: () => import('./features/objective/objective.component').then(m => m.ObjectiveComponent)
      },
      {
        path: 'reports',
        loadComponent: () => import('./features/report/reporting.component').then(m => m.ReportingComponent)
      },
      {
        path: 'etl',
        loadComponent: () => import('./features/data/etl.component').then(m => m.EtlComponent)
      }
    ]
  },
  {
    path: '403',
    loadComponent: () => import('./shared/components/access-denied/access-denied.component').then(m => m.AccessDeniedComponent)
  },
  {
    path: '**',
    redirectTo: '/dashboard'
  }
];