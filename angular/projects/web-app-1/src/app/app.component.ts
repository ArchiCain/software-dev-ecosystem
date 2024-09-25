import { AsyncPipe } from '@angular/common';
import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { Observable } from 'rxjs';
import { AppApiService } from './app-api.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, AsyncPipe],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  api1Message$?: Observable<any>;
  api2Message$?: Observable<any>;

  constructor(private appApiService: AppApiService) {}

  ngOnInit(): void {
    this.api1Message$ = this.appApiService.getMessageFromApi1();
    this.api2Message$ = this.appApiService.getMessageFromApi2();
  }
}
