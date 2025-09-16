import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-objective',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="bg-white rounded-lg shadow border border-gray-200 p-6">
      <h1 class="text-2xl font-bold text-gray-900 mb-4">Objective Manager</h1>
      <p class="text-gray-600">Objective management component will be implemented here.</p>
      <!-- TODO: Implement objective management functionality -->
    </div>
  `
})
export class ObjectiveComponent {}