import {Injectable} from '@angular/core';
import {AuthUser} from '../dto/AuthUser';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) {
  }

  auth(authUser: AuthUser): Observable<string> {
    return this.http.post<string>('http://localhost:8080/auth', authUser);
  }


}
