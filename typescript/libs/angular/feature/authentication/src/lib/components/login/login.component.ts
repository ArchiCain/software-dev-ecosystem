import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { FlexLayoutModule } from '@angular/flex-layout';
import { ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { AuthenticationService } from '../../services';
import { firstValueFrom } from 'rxjs';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [
    RouterModule,
    MatInputModule,
    MatButtonModule,
    MatCardModule,
    FlexLayoutModule,
    ReactiveFormsModule
  ],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  loginForm: FormGroup;
  errorMessage: string = '';

  constructor(
    private fb: FormBuilder,
    private authService: AuthenticationService,
    private router: Router
  ) {
    // Initialize the reactive form
    this.loginForm = this.fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required],
    });
  }

  async onSubmit(): Promise<void> {
    if (this.loginForm.valid) {
      const { username, password } = this.loginForm.value;

      try {
        // Using firstValueFrom to get the observable result
        await firstValueFrom(this.authService.login(username, password));
        // Redirect to home upon successful login
        // TODO: make this more dynamic per app
        this.router.navigate(['/home']);
      } catch (error) {
        // Handle login errors, e.g., invalid credentials
        this.errorMessage = 'Invalid username or password';
      }
    }
  }
}
