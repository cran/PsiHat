\name{p0est}
\alias{p0est}
\title{
Estimates the proportion of unaffected features (p0).
}
\description{
Estimates the proportion of null hypothesis (unaffected features) (p0). It is a wrapper of function \code{qvalue} from R package \code{qvalue}. 
}
\usage{
p0est(pvalue, lambda = seq(0, 0.9, 0.05), pi0.method = "smoother", smooth.df = 3,
    smooth.log.pi0 = FALSE, fdr.level = NULL)
}

\arguments{
  \item{pvalue}{Vector of p-values.}
% \item{robust}{
%\item{robust}{Logical. If \code{robust=TRUE},  the estimate more robust for small p-values (see package \code{qvalue}).
%}
  \item{lambda}{
Tuning parameter in [0,1) to estimate p0.
}
  \item{pi0.method}{
Method to estimate the proportion of true null hypothesis (p0):  "smoother" or "bootstrap".
}
  \item{smooth.df}{
If \code{pi0.method="smoother"}, number of degrees-of-freedom.
}
  \item{smooth.log.pi0}{
If \code{pi0.method="smoother"} and \code{smooth.log.pi0=TRUE}, p0 is estimated by applying a smoother to log p0 estimates against the tuning parameter lambda.
}
\item{fdr.level}{A level at which to control the FDR. Must be in (0,1]}.
}

\value{A number in [0,1]}

%\references{
%Storey JD. (2002) A direct approach to false discovery rates. Journal of the Royal Statistical Society, Series B, 64: 479-498.
%}
\author{
Code: Marta Padilla (wrapper of function \code{qvalue} from R package \code{qvalue})\cr
Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.
}
\seealso{
\code{qvalue} package, \code{\link{lfdr.bbe}} and \code{\link{nqvalue}}.
}
\examples{
# a p-value with missing elements:
y <- runif(15) ;y[c(13, 2,5)] <- NA
z1 <- p0est(pvalue = y, lambda = 0.5)
z2 <- p0est(pvalue = y, pi0.method = "bootstrap")
\dontshow{
    str(z1);str(z2)
}
}
\keyword{p0}
\keyword{proportion of null hypothesis}

