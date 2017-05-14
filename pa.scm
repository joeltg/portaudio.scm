(define device-info-size (c-sizeof "PaDeviceInfo"))
(define stream-params-size (c-sizeof "PaStreamParameters"))
(define float-size (c-sizeof "float"))
(define pointer-size (c-sizeof "*"))

(define (initialize)
  (c-call "Pa_Initialize"))
(define (terminate)
  (c-call "Pa_Terminate"))

(define (get-default-device)
  (c-call "Pa_GetDefaultOutputDevice"))

(define (get-device-info device)
  (c-call "Pa_GetDeviceInfo"
    (malloc device-info-size 'PaDeviceInfo)
    device))

(define (error-text err)
  (let ((text (malloc pointer-size '(* (const char)))))
    (c-call "Pa_GetErrorText" text err)
    (c-peek-cstring text)))