import { CanActivateFn } from '@angular/router';
import { KeycloakService } from 'keycloak-angular';

export function initializeAuthGuard(keycloakService: KeycloakService): CanActivateFn {
    return async (route, state) => {
        const isLoggedIn = await keycloakService.isLoggedIn();
        if (!isLoggedIn) {
            keycloakService.login({
                redirectUri: window.location.origin + state.url // Ensures redirection back to the attempted URL after login
            });
            return false;
        }
        return true;
    };
}
