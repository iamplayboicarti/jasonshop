import { Component, OnInit } from '@angular/core';
import { BaseComponent } from '../components/base/base.component';
import { ApiResponse } from '../responses/api.response';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'app-payment-callback',
  templateUrl: './payment-callback.component.html', // Tách riêng HTML
  styleUrls: ['./payment-callback.component.scss']
})
export class PaymentCallbackComponent extends BaseComponent implements OnInit { // Kế thừa BaseComponent
  loading: boolean = true;
  paymentSuccess: boolean = false;

  ngOnInit(): void {
    // Sử dụng this.activatedRoute từ BaseComponent
    this.activatedRoute.queryParams.subscribe(params => {
      debugger
      const vnp_ResponseCode = params['vnp_ResponseCode']; // Mã phản hồi từ VNPay
      const orderId:number = Number(params['vnp_TxnRef']); // Mã đơn hàng (nếu bạn truyền vào khi tạo URL thanh toán)
      debugger
      if (vnp_ResponseCode === '00') {
        // Thanh toán thành công
        this.handlePaymentSuccess(orderId);
      } else {
        // Thanh toán thất bại
        this.handlePaymentFailure();
      }
    });
  }

  handlePaymentSuccess(orderId: number): void {    
    // Sử dụng this.orderService từ BaseComponent
    this.orderService.updateOrderStatus(orderId, 'shipped').subscribe({
      next: (response: ApiResponse) => {
        this.loading = false;
        this.paymentSuccess = true;
        // Sử dụng this.toastService từ BaseComponent
        this.toastService.showToast({
          error: null,
          defaultMsg: 'Thanh toán thành công! Cảm ơn bạn đã mua hàng.',
          title: 'Thanh toán thành công',
          delay: 4000
        });
        // Sử dụng this.router từ BaseComponent để chuyển hướng
        setTimeout(() => {
          debugger
          this.cartService.clearCart();
          this.router.navigate(['/']);
        }, 3000);
      },
      error: (error: HttpErrorResponse) => {
        this.loading = false;
        this.paymentSuccess = false;
        this.toastService.showToast({
          error: error,
          defaultMsg: 'Lỗi khi cập nhật trạng thái đơn hàng',
          title: 'Lỗi'
        });
      }
    });
  }

  handlePaymentFailure(): void {
    this.loading = false;
    this.paymentSuccess = false;
    this.toastService.showToast({
      error: null,
      defaultMsg: 'Thanh toán thất bại. Vui lòng kiểm tra lại và thử lại.',
      title: 'Thanh toán thất bại',
      delay: 4000
    });
    // Chuyển hướng về trang đặt hàng
    setTimeout(() => {
      this.router.navigate(['/orders']);
    }, 3000);
  }
}