
-- Fri 19 Apr 14:24:13 2024 
-- :s /Users/aaa/myfile/github/haskell-test/isCCWUp_test.hs

-- :{
-- let isCCWUp :: (Vertex3 GLdouble, Vertex3 GLdouble, Vertex3 GLdouble) -> Vector3 GLdouble -> (Bool, GLdouble)
--     isCCWUp (p0, p1, p2) up = t 
--       where
--         epsilon = 1e-12 
--         v01 = p0 -: p1
--         v12 = p1 -: p2
--         vc = v01 `crossF` v12
--         t = case vc of
--                 Just v -> let ang = angle2Vector v up 
--                               del = ang - pi/2
--                           in case del of
--                                  d | (abs del) <= epsilon -> (False, ang)
--                                    | del < 0              -> (True, ang)
--                                    | otherwise            -> (False, ang)
-- 
--                 Nothing -> (False, -1) 
-- :}

epsilon = 1e-12 

:set +m
  p0 = Vertex3 0 0 0
  p1 = Vertex3 1 0 0
  p2 = Vertex3 0 1 0
  up = Vector3 0 0 1 
  t1 = isCCWUp (p0, p1, p2) up
  
fw "test1"
print $ fst t1 == True 
print $ snd t1
print $ (abs $ snd t1) <= epsilon
  
:set +m
  p0 = Vertex3 0 0 0
  p1 = Vertex3 1 0 0
  p2 = Vertex3 0 1 0
  up = Vector3 0 0 (-1) 
  t2 = isCCWUp (p0, p1, p2) up
  
fw "test2"
print $ fst t2 == False
print $ snd t2 
print $ (abs $ snd t2 - pi) <= epsilon


:set +m
  p0 = Vertex3 0 0 0
  p1 = Vertex3 1 0 0
  p2 = Vertex3 0 1 0
  up = Vector3 0 0.1 1 
  t3 = isCCWUp (p0, p1, p2) up
  
fw "test3"
print $ fst t3 == True 
print $ snd t3 
print $ (abs $ snd t3) < pi/2
  
:set +m
  p0 = Vertex3 0 0 0
  p1 = Vertex3 1 0 0
  p2 = Vertex3 0.5 0 0
  up = Vector3 0 0 1 
  t4 = isCCWUp (p0, p1, p2) up
  b4 = isColinear p0 p1 p2
  
fw "test4"
print $ fst t4 
print $ snd t4 
fw "b4, isColinear3d"
print b4

:set +m
  p0 = Vertex3 0 0 0
  p1 = Vertex3 1 0 0
  p2 = Vertex3 0.5 0 0.5 
  up = Vector3 0 0 1 
  t5 = isCCWUp (p0, p1, p2) up
  b5 = isColinear p0 p1 p2
  
fw "test5"
print $ fst t5 
print $ snd t5 
fw "b5, isColinear3d"
print b5

:set +m
  p0 = Vertex3 0   0 0
  p1 = Vertex3 1   0 0
  p2 = Vertex3 0.5 0 0.5 
  up = Vector3 0 1 0 
  t6 = isCCWUp (p0, p1, p2) up
  b6 = isColinear p0 p1 p2
  
fw "test6"
print $ t6 
fw "b6, isColinear3d"
print b6

:set +m
  p0 = Vertex3 0   0 0
  p1 = Vertex3 1   0 0
  p2 = Vertex3 0.5 0 0.5 
  up = Vector3 0 (-1) 0 
  t7 = isCCWUp (p0, p1, p2) up
  b7 = isColinear p0 p1 p2 

fw "test7"
print $ t7 
fw "b7, isColinear3d"
print b7










