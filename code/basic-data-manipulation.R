
## ----plus-----------------------------------------------------------------------------------------
1 + 1

## ----values-symbols-------------------------------------------------------------------------------
x = 1
x + x

## ----vector---------------------------------------------------------------------------------------
x = c(1, 2, 3)
x

## ----vectorized-----------------------------------------------------------------------------------
y = sqrt(x)
y

## ----skinning-the-cat-----------------------------------------------------------------------------
x = c(1, 2, 3)
x
x <- c(4, 5, 6)
x
x <- 7:9
x
10:12 -> x
x

## ----surprise-------------------------------------------------------------------------------------
x <- c(1, 2, 3) -> y
x
y

## ----atomic-vectors-------------------------------------------------------------------------------
people <- c("Brian", "Jim", "Herve", "Dan", "Val", "Martin")
people

## ----named-vectors--------------------------------------------------------------------------------
population <- c(Buffalo=259000, Rochester=210000, `New York`=8400000)
population
log10(population)

## ----NA-concept-----------------------------------------------------------------------------------
truthiness <- c(TRUE, FALSE, NA)
truthiness

## ----logical-concept------------------------------------------------------------------------------
!truthiness
truthiness | !truthiness
truthiness & !truthiness

## ----numerical-concept----------------------------------------------------------------------------
undefined_numeric_values <- c(NA, 0/0, NaN, Inf, -Inf)
undefined_numeric_values
sqrt(undefined_numeric_values)

## ----string-manipulation--------------------------------------------------------------------------
toupper(people)
substr(people, 1, 3)

## ----greenery-------------------------------------------------------------------------------------
x <- 1:3
x * 2            # '2' (vector of length 1) recycled to c(2, 2, 2)
truthiness | NA
truthiness & NA

## ----nested-operations----------------------------------------------------------------------------
substr(tolower(people), 1, 3)
population[population < 1000000]

## ----lists----------------------------------------------------------------------------------------
frenemies = list(
  friends=c("Larry", "Richard", "Vivian"),
  enemies=c("Dick", "Mik")
)
frenemies

## ----list-subset----------------------------------------------------------------------------------
frenemies[1]
frenemies[c("enemies", "friends")]
frenemies[["enemies"]]

## ----factors--------------------------------------------------------------------------------------
sex = factor(c("Male", "Male", "Female"),
             levels=c("Female", "Male", "Hermaphrodite"))
sex
sex == "Female"
table(sex)
sex[sex == "Female"]

## ----related-variables----------------------------------------------------------------------------
x = rnorm(1000)       # 1000 random normal deviates
y = x + rnorm(1000)   # another 1000 deviates, as a function of x
plot(y ~ x)           # relationship bewteen x and y

## ----data.frame-----------------------------------------------------------------------------------
df = data.frame(X=x, Y=y)
head(df)           # first 6 rows
plot(Y ~ X, df)    # same as above

## ----data.frame-summary---------------------------------------------------------------------------
summary(df)

## ----data.frame-subset----------------------------------------------------------------------------
positiveX = df[df$X > 0,]
head(positiveX)
plot(Y ~ X, positiveX)

## ----introspection--------------------------------------------------------------------------------
class(df)
dim(df)
colnames(df)

## ----lm-formula-----------------------------------------------------------------------------------
fit <- lm(Y ~ X, df)

## ----lm-plot--------------------------------------------------------------------------------------
plot(Y ~ X, df)
abline(fit, col="red", lwd=3)

## ----anova----------------------------------------------------------------------------------------
anova(fit)

## ----class-method-introspection-------------------------------------------------------------------
class(fit)
methods(class=class(fit))

## ---- eval=FALSE----------------------------------------------------------------------------------
#  ?rnorm
