import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class HomeApiService {

  private api1Url = 'http://api.localhost/api-1';
  private api2Url = 'http://api.localhost/api-2';

  constructor(private http: HttpClient) { }

  getMessageFromApi1(): Observable<any> {
    return this.http.get(`${this.api1Url}/`);
  }

  getMessageFromApi2(): Observable<any> {
    return this.http.get(`${this.api2Url}/`);
  }
}
