\name{rvalue}
\alias{rvalue}
\alias{nqvalue}
\title{
Rvalues and qvalues.
}
\description{
\code{rvalue} gives adjusted p-values based on qvalues, whereas \code{nqvalue} is a wrapper of function \code{qvalue} from R package \code{qvalue} with simplified output.
}
\usage{
rvalue(pvalue, robust = FALSE, ...)

nqvalue(pvalue, robust = FALSE,...)
}

\arguments{
\item{pvalue}{Input numeric vector of p-values.}
  \item{robust}{Logical. If \code{robust=TRUE}, the estimate is more robust for small p-values (see package \code{qvalue}).}
  \item{\dots}{Further arguments passed to function \code{qvalue} from R package \code{qvalue}.} 
}
\value{
A list with: 
\item{LFDR.hat}{Vector of estimates of the LFDR.}
\item{p0.hat}{Estimated p0.}
\item{pvalue}{Vector of p-values.}
\item{info}{Method name and information about computation failure.}
}
\note{
If computation fails for all features, \code{p0.hat} is set to NA and \code{LFDR.hat} is set to a vector of NA with lengh equal to the number of features. If it fails for a given feature, only the resulting LFDR.hat
for that feature is set to NA. Error messages are not suppressed.}
\references{
Padilla, M., & Bickel, D. R. (2012). Estimators of the local false discovery rate designed for small numbers of tests. Statistical Applications in Genetics and Molecular Biology, 11(5), art. 4.

Storey JD. (2002) A direct approach to false discovery rates. Journal of the Royal Statistical Society, Series B, 64: 479-498.
}
\author{
Code: Marta Padilla\cr
Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.
}
\seealso{
\code{\link{p0est}} and \code{\link[qvalue:qvalue]{qvalue}} package. 
}
\examples{

# a p-values vector with missing elements
pp <- runif(15) ;pp[c(13,2,5)]<-NA

z1 <-rvalue(pvalue = pp, robust = TRUE)
z2 <-rvalue(pvalue = pp, pi0.method="bootstrap")

z3<- nqvalue(pvalue = pp, robust = TRUE)
z4<- nqvalue(pvalue = pp, pi0.method = "bootstrap")

\dontshow{
    #rvalue:
    str(z1);str(z2)
    #nqvalue:
    str(z3);str(z4)
}
}
\keyword{rvalue}
\keyword{qvalue}


