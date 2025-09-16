import { Injectable, inject } from '@angular/core';
import { Observable, of } from 'rxjs';
import { ApiService } from './api.service';

export interface User {
  id: number;
  username: string;
  firstName: string;
  lastName: string;
  email: string;
  role: string;
  department?: string;
  active: boolean;
  createdDate: string;
}

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private apiService = inject(ApiService);

  getUsers(): Observable<User[]> {
    // TODO: replace mock with real API call
    // return this.apiService.get<User[]>('/users');

    // Mock implementation
    const mockUsers: User[] = [
      {
        id: 1,
        username: 'admin',
        firstName: 'John',
        lastName: 'Admin',
        email: 'admin@company.com',
        role: 'ROLE_ADMIN',
        department: 'Quality Management',
        active: true,
        createdDate: '2023-01-15'
      },
      {
        id: 2,
        username: 'user1',
        firstName: 'Jane',
        lastName: 'Smith',
        email: 'jane.smith@company.com',
        role: 'ROLE_USER',
        department: 'Safety',
        active: true,
        createdDate: '2023-02-20'
      },
      {
        id: 3,
        username: 'auditor1',
        firstName: 'Mike',
        lastName: 'Johnson',
        email: 'mike.johnson@company.com',
        role: 'ROLE_AUDITOR',
        department: 'Environmental',
        active: true,
        createdDate: '2023-03-10'
      }
    ];

    return of(mockUsers);
  }

  getUser(id: number): Observable<User> {
    // TODO: replace mock with real API call
    // return this.apiService.get<User>(`/users/${id}`);

    // Mock implementation
    const mockUser: User = {
      id: id,
      username: 'user' + id,
      firstName: 'User',
      lastName: 'Name',
      email: `user${id}@company.com`,
      role: 'ROLE_USER',
      department: 'Quality Management',
      active: true,
      createdDate: '2023-01-15'
    };

    return of(mockUser);
  }

  createUser(user: Omit<User, 'id'>): Observable<User> {
    // TODO: replace mock with real API call
    // return this.apiService.post<User>('/users', user);

    // Mock implementation
    const newUser: User = {
      ...user,
      id: Math.floor(Math.random() * 1000) + 100
    };

    return of(newUser);
  }

  updateUser(id: number, user: Partial<User>): Observable<User> {
    // TODO: replace mock with real API call
    // return this.apiService.put<User>(`/users/${id}`, user);

    // Mock implementation
    const updatedUser: User = {
      id: id,
      username: user.username || 'updated_user',
      firstName: user.firstName || 'Updated',
      lastName: user.lastName || 'User',
      email: user.email || 'updated@company.com',
      role: user.role || 'ROLE_USER',
      department: user.department || 'Quality Management',
      active: user.active !== undefined ? user.active : true,
      createdDate: '2023-01-15'
    };

    return of(updatedUser);
  }

  deleteUser(id: number): Observable<void> {
    // TODO: replace mock with real API call
    // return this.apiService.delete<void>(`/users/${id}`);

    // Mock implementation
    return of(undefined);
  }
}