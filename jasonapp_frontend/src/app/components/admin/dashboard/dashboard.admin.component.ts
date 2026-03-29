import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { forkJoin } from 'rxjs';
import { catchError, of } from 'rxjs';
import { BaseComponent } from '../../base/base.component';
import { ApiResponse } from '../../../responses/api.response';
import { UserResponse } from '../../../responses/user/user.response';  

@Component({
  selector: 'app-dashboard-admin',
  templateUrl: './dashboard.admin.component.html',
  styleUrls: ['./dashboard.admin.component.scss'],
  standalone: true,
  imports: [CommonModule, RouterModule]
})
export class DashboardAdminComponent extends BaseComponent implements OnInit {
  userResponse?: UserResponse | null;
  stats = {
    totalOrders: 0,
    totalProducts: 0,
  };
  recentOrders: any[] = [];
  loading = true;

  ngOnInit(): void {
    this.userResponse = this.userService.getUserResponseFromLocalStorage();
    forkJoin({
      orders: this.orderService.getAllOrders('', 0, 5).pipe(catchError(() => of(null))),
      ordersCount: this.orderService.getAllOrders('', 0, 1).pipe(catchError(() => of(null))),
      products: this.productService.getProducts('', 0, 0, 1).pipe(catchError(() => of(null))),
    }).subscribe({
      next: (results) => {
        if (results.ordersCount?.data) {
          this.stats.totalOrders = results.ordersCount.data.totalPages;
        }
        if (results.products?.data) {
          this.stats.totalProducts = results.products.data.totalPages;
        }
        if (results.orders?.data?.orders) {
          this.recentOrders = results.orders.data.orders.slice(0, 5);
        }
        this.loading = false;
      },
      error: () => {
        this.loading = false;
      }
    });
  }
}
