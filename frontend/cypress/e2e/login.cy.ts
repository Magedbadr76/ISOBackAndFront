describe('Login Flow', () => {
  beforeEach(() => {
    cy.visit('/login')
  })

  it('should display login form', () => {
    cy.contains('Sign in to QMS Connect')
    cy.get('[data-cy="username"]').should('be.visible')
    cy.get('[data-cy="password"]').should('be.visible')
    cy.get('[data-cy="login-button"]').should('be.visible')
  })

  it('should show error for invalid credentials', () => {
    cy.get('[data-cy="username"]').type('invalid')
    cy.get('[data-cy="password"]').type('invalid')
    cy.get('[data-cy="login-button"]').click()

    cy.contains('Login failed').should('be.visible')
  })

  it('should login successfully with valid credentials', () => {
    cy.get('[data-cy="username"]').type('admin')
    cy.get('[data-cy="password"]').type('admin')
    cy.get('[data-cy="login-button"]').click()

    cy.url().should('include', '/dashboard')
    cy.contains('Dashboard').should('be.visible')
  })

  it('should redirect to dashboard if already logged in', () => {
    // Login first
    cy.get('[data-cy="username"]').type('admin')
    cy.get('[data-cy="password"]').type('admin')
    cy.get('[data-cy="login-button"]').click()

    // Try to visit login page again
    cy.visit('/login')
    cy.url().should('include', '/dashboard')
  })
})