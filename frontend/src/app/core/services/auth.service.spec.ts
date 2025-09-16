import { TestBed } from '@angular/core/testing';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { Router } from '@angular/router';
import { AuthService } from './auth.service';

describe('AuthService', () => {
  let service: AuthService;
  let router: jasmine.SpyObj<Router>;

  beforeEach(() => {
    const routerSpy = jasmine.createSpyObj('Router', ['navigate']);

    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
      providers: [
        { provide: Router, useValue: routerSpy }
      ]
    });

    service = TestBed.inject(AuthService);
    router = TestBed.inject(Router) as jasmine.SpyObj<Router>;
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });

  it('should return false for isAuthenticated when no token exists', () => {
    localStorage.removeItem('auth_token');
    expect(service.isAuthenticated()).toBeFalse();
  });

  it('should return true for isAuthenticated when token exists', () => {
    localStorage.setItem('auth_token', 'test-token');
    expect(service.isAuthenticated()).toBeTrue();
  });

  it('should login successfully with valid credentials', (done) => {
    const credentials = { username: 'admin', password: 'admin' };

    service.login(credentials).subscribe({
      next: (response) => {
        expect(response.token).toBeTruthy();
        expect(response.user.username).toBe('admin');
        expect(service.isAuthenticated()).toBeTrue();
        done();
      },
      error: () => {
        fail('Login should succeed with valid credentials');
        done();
      }
    });
  });

  it('should logout and clear stored data', () => {
    localStorage.setItem('auth_token', 'test-token');
    localStorage.setItem('current_user', JSON.stringify({ id: 1, username: 'test' }));

    service.logout();

    expect(localStorage.getItem('auth_token')).toBeNull();
    expect(localStorage.getItem('current_user')).toBeNull();
    expect(router.navigate).toHaveBeenCalledWith(['/login']);
  });

  it('should check user roles correctly', () => {
    const adminUser = {
      id: 1,
      username: 'admin',
      firstName: 'Admin',
      lastName: 'User',
      email: 'admin@test.com',
      role: 'ROLE_ADMIN'
    };

    localStorage.setItem('current_user', JSON.stringify(adminUser));
    service['currentUserSubject'].next(adminUser);

    expect(service.hasRole('ROLE_ADMIN')).toBeTrue();
    expect(service.hasRole('ROLE_USER')).toBeFalse();
    expect(service.hasAnyRole(['ROLE_ADMIN', 'ROLE_USER'])).toBeTrue();
  });
});