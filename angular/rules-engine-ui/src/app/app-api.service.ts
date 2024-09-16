import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AppApiService {

  private apiUrl = 'http://rules-engine-api.traefik.me';

  constructor(private http: HttpClient) { }

  getHelloMessage(): Observable<any> {
    return this.http.get(`${this.apiUrl}/`, { responseType: 'text' });
  }
}
