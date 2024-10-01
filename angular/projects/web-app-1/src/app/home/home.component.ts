import { AsyncPipe } from '@angular/common';
import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { Observable } from 'rxjs';
import { HomeApiService } from './home-api.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, AsyncPipe],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent {
  api1Message$?: Observable<any>;
  api2Message$?: Observable<any>;

  constructor(private homeApiService: HomeApiService) {}

  ngOnInit(): void {
    this.api1Message$ = this.homeApiService.getMessageFromApi1();
    this.api2Message$ = this.homeApiService.getMessageFromApi2();
  }
}
