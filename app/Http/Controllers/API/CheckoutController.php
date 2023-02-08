<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Payment;
use http\Env\Response;
use Illuminate\Http\Request;
use stripe;
use Illuminate\Validation\ValidationException;
use Stripe\Exception\ApiErrorException;
use Stripe\Exception\CardException;
use App\Repositories\BookingRepository;


class CheckoutController extends Controller
{
    private $bookingRepository;

    public function __construct(BookingRepository $bookingRepo)
    {
        parent::__construct();
        $this->bookingRepository = $bookingRepo;
    }
    public function checkout(Request $request){
        try {
            $this->validate($request, [
                'number' => 'required',
                'exp_month' => 'required',
                'exp_year' => 'required',
                'cvc' => 'required',
                'amount'=> 'required',
                'desc' => 'required',
            ]);
            $stripe = new \Stripe\StripeClient(setting('stripe_secret'));
            $res = $stripe->tokens->create([
               'card' => [
                    'number' => $request->number,
                    'exp_month' => $request->exp_month,
                    'exp_year' => $request->exp_year,
                    'cvc' => $request->cvc
               ]
            ]);
            Stripe\Stripe::setApiKey(setting('stripe_secret'));
            $response = $stripe->charges->create([
                'amount' => $request->amount,
                'currency' => 'USD',
                'source' => $res->id,
                'description' => $request->desc
            ]);
            return $this->sendResponse($response->status,'Payment Done!');
        }
        catch (CardException $e) {
            return $this->sendError($e->getMessage());
        }
        catch (ValidationException $e) {
            return $this->sendError(array_values($e->errors()));
        }
        catch (Exception $e){
            return $this->sendError($e->getMessage(), 200);
        }
    }

    public function paySuccess(Request $request)
    {
        try {
            $this->validate($request, [
                'number' => 'required',
                'exp_month' => 'required',
                'exp_year' => 'required',
                'cvc' => 'required',
                'desc' => 'required',
                'amount' => 'required',
                'bookingId' => 'required'
            ]);
            $booking = $this->bookingRepository->findWithoutFail($request->bookingId);
            if (empty($booking)) {
                return $this->sendError("Error processing stripe payment for your booking");
            }else{
                $payment = Payment::find($booking->payment_id);
                if($payment){
                    if($payment->payment_status_id == 2){
                        return $this->sendError("Booking already paid!");
                    }
                } else{
                    return $this->sendError("Error processing stripe payment for your booking");
                }
            }
            $stripe = new \Stripe\StripeClient(setting('stripe_secret'));
            $res = $stripe->tokens->create([
                'card' => [
                    'number' => $request->number,
                    'exp_month' => $request->exp_month,
                    'exp_year' => $request->exp_year,
                    'cvc' => $request->cvc
                ]
            ]);
            Stripe\Stripe::setApiKey(setting('stripe_secret'));
            $response = $stripe->charges->create([
                'amount' =>  $request->amount,
                'currency' => 'USD',
                'source' => $res->id,
                'description' => $request->desc
            ]);
            if($response->status == "succeeded"){
                $payment->payment_status_id = 2;
                $payment->update();
                return $this->sendResponse($response->status,'Payment Done!');
            } else{
                return $this->sendError("Payment failed");
            }
        }
        catch (CardException $e) {
            return $this->sendError($e->getMessage());
        }
        catch (ValidationException $e) {
            return $this->sendError(array_values($e->errors()));
        }
        catch (ApiErrorException $e) {
            return $this->sendError($e->getMessage());
        }
        catch (Exception $e){
            return $this->sendError($e->getMessage(), 200);
        }
    }


}
