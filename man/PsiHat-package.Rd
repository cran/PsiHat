\name{PsiHat-package}
\alias{PsiHat-package}
\alias{PsiHat}
\docType{package}
\title{Several Local False Discovery Rate Estimators
}
\description{
Suite of R functions for the estimation of local false discovery rate (LFDR)
using different methods.
}
\details{
\tabular{ll}{
Package: \tab PsiHat\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-09-30\cr
License: \tab GPL-3\cr
Depends: \tab R (>= 2.14.0), methods, qvalue, splines \cr
URL: \tab http://www.r-project.org, http://www.bioconductor.org, http://www.statomics.com\cr
}
 
}
\author{
    Code: David R. Bickel and M. Padilla (modifications).\cr
    Authors of included code from other R packages: Bradley Efron, Brit B. Turnbull, Balasubramanian Narasimhan (package: \code{locfdr}).\cr
    Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.\cr
    Maintainer: M. Padilla <padilla.mpf@gmail.com>
}
\references{
Bickel, D. R. (2013). Simple estimators of false discovery rates given as few as one or two p-values without strong parametric assumptions. Statistical Applications in Genetics and Molecular Biology, Statistical Applications in Genetics and Molecular Biology, 12(4), pp. 529-43.

Padilla, M., & Bickel, D. R. (2012). Estimators of the local false discovery rate designed for small numbers of tests. Statistical Applications in Genetics and Molecular Biology, 11(5), art. 4.
}
\keyword{ Local False Discovery Rate }
\keyword{ LFDR }
\keyword{ BBE }
\keyword{ HBE }
\keyword{ HBEA }
\seealso{
R packages: \code{\link[qvalue:qvalue]{qvalue}} and \code{locfdr} (v1.1.7).
}
\examples{
# a vector of p-values with missing elements:
y <- runif(55); y[c(13, 2,5)] <- NA

z1 <- lfdr.bbe1(pvalue = y, monotonic = TRUE)
z2 <- lfdr.bbe1(pvalue = y, robust = TRUE)
z3 <- lfdr.bbe(pvalue = y)
z4 <- rvalue(pvalue = y)
z8 <- lfdr.assumedNull(pvalue=y,plot=0,df=3)

# a statistic vector with missing elements:
y <- runif(55, -1, 5); y[c(13, 2,5)] <- NA

z5 <- lfdr.empiricalNull(stat = y, plot = 0, df = 3)
z6 <- lfdr.assumedNull(stat = y, plot = 0, df = 5)
z7 <- lfdr.elfdr(stat = y, plot = 0, df = 6)

\dontshow{
str(z1);str(z2);str(z3);str(z4)
str(z5);str(z6);str(z7);str(z8)
}

}

