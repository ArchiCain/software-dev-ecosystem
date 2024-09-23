import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AppApiService {

  private apiUrl = 'http://api.rules-engine.localhost';

  constructor(private http: HttpClient) { }

  getHelloMessage(): Observable<any> {
    return this.http.get(`${this.apiUrl}/`, { responseType: 'text' });
  }

  getHelloFromSecondEndpoint(): Observable<any> {
    return this.http.get(`${this.apiUrl}/second-endpoint`, { responseType: 'text' });
  }
}
