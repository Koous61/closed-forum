import {Component} from '@angular/core';
import {AuthService} from './service/auth.service';
import {AuthUser} from './dto/AuthUser';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {

  constructor(private authService: AuthService) {
    authService.auth(new AuthUser('login', 'password'));
  }

}
