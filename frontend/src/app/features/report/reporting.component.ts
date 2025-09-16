import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-reporting',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="bg-white rounded-lg shadow border border-gray-200 p-6">
      <h1 class="text-2xl font-bold text-gray-900 mb-4">Reporting</h1>
      <p class="text-gray-600">Reporting dashboard component will be implemented here.</p>
      <!-- TODO: Implement reporting functionality -->
    </div>
  `
})
export class ReportingComponent {}