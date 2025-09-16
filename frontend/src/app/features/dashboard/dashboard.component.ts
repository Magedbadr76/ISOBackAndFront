import { Component, OnInit, ViewChild, ElementRef, AfterViewInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Chart, ChartConfiguration, ChartType, registerables } from 'chart.js';

// Register Chart.js components
Chart.register(...registerables);

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="space-y-6">
      <!-- Header -->
      <div class="bg-white rounded-lg shadow border border-gray-200 fade-in">
        <div class="p-6 flex justify-between items-center">
          <h1 class="text-2xl font-bold text-gray-900">Dashboard</h1>

          <div class="flex items-center space-x-2">
            <input
              type="search"
              placeholder="Type your query"
              class="px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500">
            <button class="px-4 py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors">
              <i class="fas fa-search"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Main content -->
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <!-- Main chart area -->
        <div class="lg:col-span-2">
          <div class="bg-white rounded-lg shadow border border-gray-200 fade-in">
            <div class="p-6">
              <h2 class="text-lg font-semibold text-gray-900 mb-4">Audits by Status</h2>
              <div class="h-80">
                <canvas #mainChart></canvas>
              </div>
            </div>
          </div>
        </div>

        <!-- Side charts -->
        <div class="space-y-6">
          <!-- Pending Audits Per Area -->
          <div class="bg-white rounded-lg shadow border border-gray-200 fade-in">
            <div class="p-4 border-b border-gray-200 text-center font-semibold text-gray-800">
              Pending Audits Per Area
            </div>
            <div class="p-6">
              <div class="h-48">
                <canvas #pieChart1></canvas>
              </div>
            </div>
          </div>

          <!-- Completed Audits Per Area -->
          <div class="bg-white rounded-lg shadow border border-gray-200 fade-in">
            <div class="p-4 border-b border-gray-200 text-center font-semibold text-gray-800">
              Completed Audits Per Area
            </div>
            <div class="p-6">
              <div class="h-48">
                <canvas #pieChart2></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Statistics Cards -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div class="bg-white rounded-lg shadow border border-gray-200 p-6 fade-in">
          <div class="flex items-center">
            <div class="p-2 bg-blue-100 rounded-md">
              <i class="fas fa-clipboard-list text-blue-600 text-xl"></i>
            </div>
            <div class="ml-4">
              <p class="text-sm font-medium text-gray-600">Total Audits</p>
              <p class="text-2xl font-bold text-gray-900">{{ stats.totalAudits }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow border border-gray-200 p-6 fade-in">
          <div class="flex items-center">
            <div class="p-2 bg-green-100 rounded-md">
              <i class="fas fa-check-circle text-green-600 text-xl"></i>
            </div>
            <div class="ml-4">
              <p class="text-sm font-medium text-gray-600">Completed</p>
              <p class="text-2xl font-bold text-gray-900">{{ stats.completedAudits }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow border border-gray-200 p-6 fade-in">
          <div class="flex items-center">
            <div class="p-2 bg-yellow-100 rounded-md">
              <i class="fas fa-clock text-yellow-600 text-xl"></i>
            </div>
            <div class="ml-4">
              <p class="text-sm font-medium text-gray-600">Pending</p>
              <p class="text-2xl font-bold text-gray-900">{{ stats.pendingAudits }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow border border-gray-200 p-6 fade-in">
          <div class="flex items-center">
            <div class="p-2 bg-red-100 rounded-md">
              <i class="fas fa-exclamation-triangle text-red-600 text-xl"></i>
            </div>
            <div class="ml-4">
              <p class="text-sm font-medium text-gray-600">Overdue</p>
              <p class="text-2xl font-bold text-gray-900">{{ stats.overdueAudits }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  `
})
export class DashboardComponent implements OnInit, AfterViewInit {
  @ViewChild('mainChart') mainChartRef!: ElementRef<HTMLCanvasElement>;
  @ViewChild('pieChart1') pieChart1Ref!: ElementRef<HTMLCanvasElement>;
  @ViewChild('pieChart2') pieChart2Ref!: ElementRef<HTMLCanvasElement>;

  stats = {
    totalAudits: 156,
    completedAudits: 89,
    pendingAudits: 45,
    overdueAudits: 12
  };

  ngOnInit() {
    // TODO: Load dashboard data from API
  }

  ngAfterViewInit() {
    this.createMainChart();
    this.createPieCharts();
  }

  private createMainChart() {
    const ctx = this.mainChartRef.nativeElement.getContext('2d');
    if (!ctx) return;

    // TODO: replace mock with real API data
    const mockData = {
      labels: ['Completed', 'In Progress', 'Pending', 'Overdue', 'Cancelled'],
      data: [89, 23, 45, 12, 8]
    };

    const colors = this.generateColors(mockData.data.length);

    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: mockData.labels,
        datasets: [{
          label: '# of Audits',
          data: mockData.data,
          backgroundColor: colors,
          borderColor: colors,
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }

  private createPieCharts() {
    this.createPieChart1();
    this.createPieChart2();
  }

  private createPieChart1() {
    const ctx = this.pieChart1Ref.nativeElement.getContext('2d');
    if (!ctx) return;

    // TODO: replace mock with real API data
    const mockData = {
      labels: ['Quality', 'Safety', 'Environmental', 'Security'],
      data: [15, 8, 12, 10]
    };

    const colors = this.generateColors(mockData.data.length);

    new Chart(ctx, {
      type: 'pie',
      data: {
        labels: mockData.labels,
        datasets: [{
          data: mockData.data,
          backgroundColor: colors,
          hoverBackgroundColor: colors
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false
          }
        }
      }
    });
  }

  private createPieChart2() {
    const ctx = this.pieChart2Ref.nativeElement.getContext('2d');
    if (!ctx) return;

    // TODO: replace mock with real API data
    const mockData = {
      labels: ['Quality', 'Safety', 'Environmental', 'Security'],
      data: [25, 18, 22, 24]
    };

    const colors = this.generateColors(mockData.data.length);

    new Chart(ctx, {
      type: 'pie',
      data: {
        labels: mockData.labels,
        datasets: [{
          data: mockData.data,
          backgroundColor: colors,
          hoverBackgroundColor: colors
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false
          }
        }
      }
    });
  }

  private generateColors(count: number): string[] {
    const colors = [];
    for (let i = 0; i < count; i++) {
      const r = Math.floor(Math.random() * 255);
      const g = Math.floor(Math.random() * 255);
      const b = Math.floor(Math.random() * 255);
      colors.push(`rgb(${r}, ${g}, ${b})`);
    }
    return colors;
  }
}