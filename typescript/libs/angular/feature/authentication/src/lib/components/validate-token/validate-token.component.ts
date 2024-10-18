import { Component } from '@angular/core';
import { AuthenticationService } from '../../services';
import { CommonModule } from '@angular/common';
import { MatInputModule } from '@angular/material/input';

@Component({
  selector: 'lib-validate-token',
  standalone: true,
  imports: [CommonModule, MatInputModule],
  templateUrl: './validate-token.component.html',
  styleUrls: ['./validate-token.component.scss']
})
export class ValidateTokenComponent {
  validationMessage: string = '';

  constructor(private authenticationService: AuthenticationService) {}

  validateToken() {
    this.authenticationService.validate().subscribe({
      next: () => {
        this.validationMessage = 'Token is valid';
      },
      error: () => {
        this.validationMessage = 'Token validation failed';
      }
    });
  }
}