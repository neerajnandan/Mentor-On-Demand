import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RegisterComponent } from './USER/register/register.component';
import { LoginComponent } from './USER/login/login.component';
import { MentorDetailsComponent } from './USER/mentor-details/mentor-details.component';
import { SearchComponent } from './search/search.component';
import { MentorHomeComponent } from './mentor-home/mentor-home.component';
import { AddSkillComponent } from './mentor-home/add-skill/add-skill.component';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
@NgModule({
  declarations: [
    AppComponent,
    RegisterComponent,
    LoginComponent,
    MentorDetailsComponent,
    SearchComponent,
    MentorHomeComponent,
    AddSkillComponent,
    HeaderComponent,
    FooterComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
