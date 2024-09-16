
-- Sun 21 Apr 22:28:23 2024
-- /Users/aaa/myfile/github/haskell-test/detVerProj_test.hs

p0 = Vertex3 0 0 0
p1 = Vertex3 1 0 0
p2 = Vertex3 0 1 0

-- v01 = p0 -: p1
-- v01 = 1 0 0
-- v12 = p1 -: p2
-- v12 = -1 1 0

--  1  -1   x
--  0   1
--  0   0

dx1 = detVerProj (0, 1, 1) (p0, p1, p2)
fw "test1"
print $ dx1 == 0

--  1  -1
--  0   1  x
--  0   0
dx2 = detVerProj (1, 0, 1) (p0, p1, p2)
fw "test2"
print $ dx2 == 0

--  1  -1
--  0   1  
--  0   0  x 
dx3 = detVerProj (1, 1, 0) (p0, p1, p2)
fw "test3"
print $ dx3 == 1 

p0 = Vertex3 1 2 3 
p1 = Vertex3 2 4 5 
p2 = Vertex3 2 1 3 

-- v01 = p0 -: p1
-- v01 = (1, 2, 2) 
-- v12 = p1 -: p2
-- v12 = (0, -3, -2)

-- 1   0  x
-- 2  -3
-- 2  -2
dx4 = detVerProj (0, 1, 1) (p0, p1, p2)
fw "test4"
print $ dx4 == 2 * (-2) - (-3) * 2 

-- 1   0  
-- 2  -3  x
-- 2  -2
dx5 = detVerProj (1, 0, 1) (p0, p1, p2)
fw "test5"
print $ dx5 == 1 * (-2) - 0 

-- 1   0  
-- 2  -3  
-- 2  -2  x
dx6 = detVerProj (1, 1, 0) (p0, p1, p2)
fw "test6"
print $ dx6 == 1 * (-3) - 0 

