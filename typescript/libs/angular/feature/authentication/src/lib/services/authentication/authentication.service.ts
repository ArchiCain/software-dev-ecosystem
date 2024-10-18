import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {
  private readonly authApiUrl = 'https://api.localhost/auth-api';

  constructor(private http: HttpClient) {}

  login(username: string, password: string): Observable<any> {
    return this.http.post<any>(`${this.authApiUrl}/login`, { username, password }, { withCredentials: true });
  }

  validate(): Observable<any> {
    return this.http.get<any>(`${this.authApiUrl}/validate`, { withCredentials: true });
  }
}
