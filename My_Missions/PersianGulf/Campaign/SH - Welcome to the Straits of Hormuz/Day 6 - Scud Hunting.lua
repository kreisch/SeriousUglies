local TestScheduler = SCHEDULER:New( nil, 
  function()
    BASE:E( "Hello World 1")
  end, {}, 1 
  )