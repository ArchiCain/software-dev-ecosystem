import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AppApiService {

  private apiUrl = 'http://127.0.0.1:30001';  // Base URL of NestJS API service

  constructor(private http: HttpClient) { }

  getHelloMessage(): Observable<any> {
    return this.http.get(`${this.apiUrl}/`);
  }
}
