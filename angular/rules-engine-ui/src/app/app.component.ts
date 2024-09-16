import { Component, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { AppApiService } from './app-api.service';
import { Observable } from 'rxjs';
import { AsyncPipe } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, AsyncPipe],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent implements OnInit {
  helloMessage$?: Observable<any>;

  constructor(private appApiService: AppApiService) {}

  ngOnInit(): void {
    this.helloMessage$ = this.appApiService.getHelloMessage();
  }
}
