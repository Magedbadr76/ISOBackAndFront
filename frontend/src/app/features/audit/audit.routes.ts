import { Routes } from '@angular/router';

export const auditRoutes: Routes = [
  {
    path: '',
    loadComponent: () => import('./audit-list/audit-list.component').then(m => m.AuditListComponent)
  },
  {
    path: 'plan',
    loadComponent: () => import('./audit-plan/audit-plan.component').then(m => m.AuditPlanComponent)
  },
  {
    path: 'internal',
    loadComponent: () => import('./internal-audit/internal-audit.component').then(m => m.InternalAuditComponent)
  },
  {
    path: 'schedules',
    loadComponent: () => import('./schedule-list/schedule-list.component').then(m => m.ScheduleListComponent)
  },
  {
    path: 'schedules/accepted',
    loadComponent: () => import('./accepted-schedules/accepted-schedules.component').then(m => m.AcceptedSchedulesComponent)
  }
];