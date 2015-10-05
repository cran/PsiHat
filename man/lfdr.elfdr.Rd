\name{lfdr.elfdr}
\alias{lfdr.elfdr}
\title{
Expected LFDR (ELFDR).
}
\description{
Expected LFDR (ELFDR) of HBE with empirical estimation of the null hypothesis distribution (HBEE) from function \code{lfdr.empiricalNull}.
}
\usage{
lfdr.elfdr(stat= NULL, pvalue = NULL, nulltype = 1, bre = 120,
    df = 7, plot = 0, ...)
}
\arguments{
  \item{stat}{Input numeric vector of statistics. At least one of the inputs (pvalue or stat) must be non null.}
    \item{pvalue}{Optional input numeric vector of p-values. At least one of the inputs (pvalue or stat) must be non null. If the non empty input is a vector of p-values, the function qnorm is applied to it (see manual of package \code{locfdr}).}
    \item{nulltype}{Parameter for selection of the type of null hypothesis distribution in Efrons method. The value nulltype = 1 is the default in \code{lfdr.elfdr} (See function \code{locfdr} in \code{locfdr} package).}
    \item{bre}{Number of breaks in the discretization of the z-score axis in Efrons method (see package \code{locfdr}). Useful when the number of features is small.}
    \item{df}{Degrees of freedom for fitting the estimated density \eqn{f(z)} in Efrons method (see package \code{locfdr}). Useful when the number of features is small.}
    \item{plot}{Optional. If \code{plot=0}, no plots are made (see package \code{locfdr}).}    
    \item{\dots}{Further arguments to pass to function \code{locfdr} to compute HBEE (see \code{locfdr} R package).}% # \item{plot}{plot=0 indicates no plots.}
}
\value{
A list with: 
\item{LFDR.hat}{Vector of estimates of the HBE.}
\item{p0.hat}{Estimated proportion of unaffected features p0 (null hypothesis).}
\item{stat}{Input vector of statistics.}
\item{info}{Method name and information about computation failure.}
}
\note{
If computation fails for all features, \code{p0.hat} is set to NA and \code{LFDR.hat} is set to a vector of NA with lengh equal to the number of features. If it fails for a given feature, only the resulting LFDR
for that feature is set to NA. Error messages are not suppressed.
}
\references{
Padilla, M., & Bickel, D. R. (2012). Estimators of the local false discovery rate designed for small numbers of tests. Statistical Applications in Genetics and Molecular Biology, 11(5), art. 4.
}
\author{
Code: David R. Bickel and Marta Padilla (modifications),\cr
Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.

}
\seealso{
Function \code{\link{lfdr.empiricalNull}}.
}
\examples{

# a statistic vector with missing elements
ss <- runif(55,-1,5) ;ss[c(13,2,5)]<-NA
# a p-values vector with missing elements
pp <- runif(55) ;pp[c(13,2,5)]<-NA

z1 <- lfdr.elfdr(stat = ss, df = 3)
z2 <- lfdr.elfdr(pvalue = pp, df = 3)

\dontshow{
    str(z1);str(z2)
}
}
\keyword{ ELFDR }
\keyword{ Expected Local False Discovery Rate }

