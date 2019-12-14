import { TestBed } from '@angular/core/testing';

import { MentorGuardService } from './mentor-guard.service';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { RouterTestingModule } from '@angular/router/testing';

describe('MentorGuardService', () => {
  beforeEach(() => TestBed.configureTestingModule({ imports: [ReactiveFormsModule, HttpClientTestingModule, RouterTestingModule,FormsModule]}));

  it('should be created', () => {
    const service: MentorGuardService = TestBed.get(MentorGuardService);
    expect(service).toBeTruthy();
  });
});
