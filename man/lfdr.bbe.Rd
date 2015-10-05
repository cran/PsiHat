\name{lfdr.bbe}
\alias{lfdr.bbe}
\alias{lfdr.bbe1}
\title{
Binomial-based LFDR estimator.
}
\description{
A binomial-based estimator of the local false discovery rate (BBE) with p0 estimation (use \code{lfdr.bbe}). 
When p0 = 1 the estimator is called BBE1 (use \code{lfdr.bbe1}). %#Storey (2002) proposes ways to estimate p0.
}
\usage{
lfdr.bbe(pvalue, p0 = NULL, robust = FALSE, monotonic = FALSE, ...)
    
lfdr.bbe1(pvalue, robust = FALSE, monotonic = FALSE, ...)
}
\arguments{
    \item{pvalue}{Input numeric vector of p-values.}
  \item{p0}{Proportion of non-affected features, it is NULL or a value within [0,1]. For \code{lfdr.bbe1} p0=1, while for \code{lfdr.bbe} it can be set or it can be estimated internally by \code{p0est}, setting \code{p0=NULL} (the default value).}
  \item{robust}{Logical. If \code{robust=TRUE}, the estimate is more robust for small p-values. If \code{robust=TRUE}, the estimate is more robust for small p-values (see package \code{qvalue}).}
  \item{monotonic}{Logical. If \code{monotonic=TRUE}, LFDR estimates are monotonically increasing with p-values.}
  \item{\dots}{Further arguments passed to function \code{p0est}.}
}

\value{
A list with: 
\item{LFDR.hat}{Vector of estimates of the LFDR,}
\item{p0.hat}{Estimated p0 (for BBE), 1 (for BBE1)}
\item{pvalue}{Vector of p-values.}
\item{info}{Method name and information about computation failure.}
}
\note{
If computation fails for all features, \code{p0.hat} is set to NA and \code{LFDR.hat} is set to a vector of NA with lengh equal to the number of features. If it fails for a given feature, only the resulting LFDR
for that feature is set to NA. Error messages are not suppressed.}
\references{
Bickel, D. R. (2013). Simple estimators of false discovery rates given as few as one or two p-values without strong parametric assumptions. Statistical Applications in Genetics and Molecular Biology, Statistical Applications in Genetics and Molecular Biology, 12(4), pp. 529-43.

Padilla, M., & Bickel, D. R. (2012). Estimators of the local false discovery rate designed for small numbers of tests. Statistical Applications in Genetics and Molecular Biology, 11(5), art. 4.
%Storey JD. (2002) A direct approach to false discovery rates. Journal of the Royal Statistical Society, Series B, 64: 479-498.
}
\author{
Code: David R. Bickel and Marta Padilla (modifications),\cr
Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.
}

\seealso{
\code{\link[qvalue:qvalue]{qvalue}} package and \code{\link{p0est}} and \code{\link{nqvalue}}. 
}
\examples{
# a p-values vector with missing elements
pp <- runif(15) ;pp[c(13,2,5)]<-NA

#BBE1:
z1 <- lfdr.bbe1(pvalue = pp, robust = TRUE)
z2 <- lfdr.bbe1(pvalue = pp, robust = FALSE, monotonic = TRUE)

#estimating or setting p0:
z3 <- lfdr.bbe(pvalue = pp, p0 = NULL)
z4 <- lfdr.bbe(pvalue = pp, pi0.method = "bootstrap")
z5 <- lfdr.bbe(pvalue = pp, p0 = 0.8, robust = TRUE, monotonic = TRUE)


\dontshow{
#BBE1:
str(z1);str(z2)
#BBE:
str(z3);str(z4)}
}
\keyword{ BBE }
\keyword{ BBE1 }
\keyword{ LFDR-BBE }
\keyword{ LFDR-BBE1 }
\keyword{ Binomial-Based Estimator }
\keyword{\code{lfdr.bbe}}
\keyword{\code{lfdr.bbe1}}
