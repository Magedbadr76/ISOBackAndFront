import { Injectable, inject } from '@angular/core';
import { Observable, of } from 'rxjs';
import { ApiService } from './api.service';

export interface DashboardStats {
  totalAudits: number;
  completedAudits: number;
  pendingAudits: number;
  overdueAudits: number;
}

export interface ChartData {
  labels: string[];
  data: number[];
}

@Injectable({
  providedIn: 'root'
})
export class DashboardService {
  private apiService = inject(ApiService);

  getDashboardStats(): Observable<DashboardStats> {
    // TODO: replace mock with real API call
    // return this.apiService.get<DashboardStats>('/dashboard/stats');

    // Mock implementation
    const mockStats: DashboardStats = {
      totalAudits: 156,
      completedAudits: 89,
      pendingAudits: 45,
      overdueAudits: 12
    };

    return of(mockStats);
  }

  getAuditsByStatus(): Observable<ChartData> {
    // TODO: replace mock with real API call
    // return this.apiService.get<ChartData>('/dashboard/audits-by-status');

    // Mock implementation
    const mockData: ChartData = {
      labels: ['Completed', 'In Progress', 'Pending', 'Overdue', 'Cancelled'],
      data: [89, 23, 45, 12, 8]
    };

    return of(mockData);
  }

  getPendingAuditsByDepartment(): Observable<ChartData> {
    // TODO: replace mock with real API call
    // return this.apiService.get<ChartData>('/dashboard/pending-by-department');

    // Mock implementation
    const mockData: ChartData = {
      labels: ['Quality', 'Safety', 'Environmental', 'Security'],
      data: [15, 8, 12, 10]
    };

    return of(mockData);
  }

  getCompletedAuditsByDepartment(): Observable<ChartData> {
    // TODO: replace mock with real API call
    // return this.apiService.get<ChartData>('/dashboard/completed-by-department');

    // Mock implementation
    const mockData: ChartData = {
      labels: ['Quality', 'Safety', 'Environmental', 'Security'],
      data: [25, 18, 22, 24]
    };

    return of(mockData);
  }
}