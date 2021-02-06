;nyquist plug-in
;version 4
;type tool
;name "Debreather"

(setf fullVolume 1.0)
(setf quietColume 0.2)

(setf time0 0)      ; time relative to the start of the selection
(setf time1 0.05)   ; time relative to the start of the selection
(setf time2 -0.05)  ; time relative to the end of the selection
(setf time3 0)      ; time relative to the end of the selection

(let ((start (get '*selection* 'start)))
  (setf command (format nil
                        "SetEnvelope: Time=~s Value=~s"
                        (+ start time0)
                        fullVolume))
  (aud-do command))

(let ((start (get '*selection* 'start)))
  (setf command (format nil
                        "SetEnvelope: Time=~s Value=~s"
                        (+ start time1)
                        quietColume))
  (aud-do command))

(let ((start (get '*selection* 'end)))
  (setf command (format nil
                        "SetEnvelope: Time=~s Value=~s"
                        (+ start time2)
                        quietColume))
  (aud-do command))

(let ((start (get '*selection* 'end)))
  (setf command (format nil
                        "SetEnvelope: Time=~s Value=~s"
                        (+ start time3)
                        fullVolume))
  (aud-do command))
