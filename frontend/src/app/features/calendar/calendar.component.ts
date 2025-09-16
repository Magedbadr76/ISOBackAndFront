import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-calendar',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="bg-white rounded-lg shadow border border-gray-200 p-6">
      <h1 class="text-2xl font-bold text-gray-900 mb-4">Calendar</h1>
      <p class="text-gray-600">Calendar component will be implemented here.</p>
      <!-- TODO: Implement calendar functionality -->
    </div>
  `
})
export class CalendarComponent {}