//%attributes = {"invisible":true}

  //the name of the callback method is set inside the form objet "CallBack" inside
  //the subform from where this method is called; So it can be acessed and used.

C_POINTER:C301($PtrCallback;$PtrProgressID)
C_TEXT:C284($CallbackMethod)
C_LONGINT:C283($ProgressID)
C_LONGINT:C283($ps)
C_LONGINT:C283($p)


$PtrCallback:=OBJECT Get pointer:C1124(Object named:K67:5;"CallBack")
If (Not:C34(Is nil pointer:C315($PtrCallback)))  // this should neve happend
	$PtrProgressID:=OBJECT Get pointer:C1124(Object named:K67:5;"ProgressID")
	If (Not:C34(Is nil pointer:C315($PtrProgressID)))  // // this should never happend
		
		$CallbackMethod:=$PtrCallback->
		$ProgressID:=$PtrProgressID->
		
		Progress__Semaphore_ON   //************* 
		
		$p:=Find in array:C230(<>_ProgressID;$ProgressID)
		If ($p>0)
			<>_ProgressCanceled{$p}:=True:C214
		Else 
			  // already deleted,nothing to do
		End if 
		
		Progress__Semaphore_OFF   //*************
		
		If ($CallbackMethod#"") & ($p>0)
			
			  // A new process is created that will call the callback method (and will die when done)
			  // this allows to free the progress process so it can catch external calls
			
			$ps:=New process:C317("Progress__CallCallBack";32000;"$CallCallback";$CallbackMethod;$ProgressID)
		Else 
			  // no callback or already deleted, do nothing!
		End if 
		
	End if 
End if 
