\name{lfdr.empiricalNull}
\alias{lfdr.empiricalNull}
\alias{lfdr.assumedNull}
\title{
Histogram-based estimator (HBE).
}
\description{
Wrapper of Efrons LFDR (here called Histogram-based estimator (HBE)) with empirical estimation of the null hypothesis distribution (HBEE): \code{lfdr.empiricalNull} (nulltype=1 by default)
or with assumed theoretical null hypothesis distribution as N(0,1) (HBEA): \code{lfdr.assumedNull}. 
}
\usage{
lfdr.assumedNull(stat= NULL, pvalue = NULL, bre = 120, df = 7, plot = 0, ...)

lfdr.empiricalNull(stat= NULL, pvalue = NULL, nulltype = 1, bre = 120,
    df = 7, plot = 0, ...)
}

\arguments{
  \item{stat}{Input numeric vector of statistics. At least one of the inputs (pvalue or stat) must be non null.}
   \item{pvalue}{Optional input numeric vector of p-values. At least one of the inputs (pvalue or stat) must be non null. If the non empty input is a vector of p-values, the function qnorm is applied to it (see manual of package \code{locfdr}).}
    \item{nulltype}{Parameter for selection of the type of null hypothesis distribution in Efrons method. The value nulltype = 1 is the default in \code{lfdr.elfdr} (See function \code{locfdr} in \code{locfdr} package).}
    \item{bre}{Number of breaks in the discretization of the z-score axis in Efrons method (see package \code{locfdr}). Useful when the number of features is small.}
    \item{df}{Degrees of freedom for fitting the estimated density \eqn{f(z)} in Efrons method (see package \code{locfdr}). Useful when the number of features is small.}
    \item{plot}{Optional. If plot = 0, no plots are made (see package \code{locfdr}).}    
    \item{\dots}{Further arguments to pass to function \code{locfdr} to compute HBEE (see \code{locfdr} R package).}
}
\value{
A list with: 
\item{LFDR.hat}{Vector of estimates of the HBE.}
\item{p0.hat}{Estimated proportion of affected features p0 (null hypothesis).}
\item{stat}{Input vector of statistics.}
\item{info}{Method name and information about computation failure.}
}
\note{
    Functions \code{lfdr.assumedNull} and \code{lfdr.empirical} are based on function \code{locfdr} from package \code{locfdr} (v1.1.7). See references.
    
    If computation fails for all features, \code{p0.hat} is set to NA and \code{LFDR.hat} is set to a vector of NA with lenght equal to the number of features. If it fails for a given feature, only the resulting LFDR for that feature is set to NA. Error messages are not suppressed.}
\references{
%Efron, B. (2004). Large-Scale Simultaneous Hypothesis Testing: The Choice of a Null Hypothesis. Journal of the American Statistical Association, 99, 96-104.
%
Efron, B., Turnbull, B. B., & Narasimhan, B. (2011). locfdr: Computes local false discovery rates. Retrieved from \url{http://cran.r-project.org/src/contrib/Archive/locfdr/}
}
\author{
Code: David R. Bickel and Marta Padilla (modifications).\cr
Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.\cr
Authors of R package \code{locfdr} on which these functions are based: Bradley Efron, Brit B. Turnbull, Balasubramanian Narasimhan.
}
\seealso{
\code{\link{lfdr.elfdr}}, \code{locfdr} function and package, and R package \code{splines}.}
\examples{
# a statistic vector with missing elements
ss <- runif(55,-1,5) ;ss[c(13,2,5)]<-NA
# a p-values vector with missing elements
pp <- runif(55) ;pp[c(13,2,5)]<-NA

z1 <- lfdr.assumedNull(stat = ss, df = 3)
z2 <- lfdr.empiricalNull(pvalue = pp, df=3)

\dontshow{
    str(z1);str(z2)
}
}
\keyword{ Histogram-Based Estimator }
\keyword{ HBE }
\keyword{ HBEA }
\keyword{ HBEE }
