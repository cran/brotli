% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/brotli.R
\name{brotli}
\alias{brotli}
\alias{brotli_compress}
\alias{brotli_decompress}
\title{Brotli Compression}
\usage{
brotli_compress(buf, quality = 11, window = 22)

brotli_decompress(buf)
}
\arguments{
\item{buf}{raw vector with data to compress/decompress}

\item{quality}{value between 0 and 11}

\item{window}{log of window size}
}
\description{
Brotli is a compression algorithm optimized for the web, in particular small text
documents.
}
\details{
Brotli decompression is at least as fast as for gzip while significantly
improving the compression ratio. The price we pay is that compression is much
slower than gzip. Brotli is therefore most effective for serving static content
such as fonts and html pages.

For binary (non-text) data, the compression ratio of Brotli usually does not beat
\code{bz2} or \code{xz (lzma)}, however decompression for these algorithms is too
slow for browsers in e.g. mobile devices.
}
\examples{
# Simple example
myfile <- file.path(R.home(), "COPYING")
x <- readBin(myfile, raw(), file.info(myfile)$size)
y <- brotli_compress(x)
stopifnot(identical(x, brotli_decompress(y)))

# Compare to other algorithms
length(x)
length(brotli_compress(x))
length(memCompress(x, "gzip"))
length(memCompress(x, "bzip2"))
length(memCompress(x, "xz"))
}
\references{
J. Alakuijala and Z. Szabadka (July 2016). \emph{Brotli Compressed
Data Format}. IETF Internet Draft \url{https://www.rfc-editor.org/rfc/rfc7932}.
}
\seealso{
\link{memCompress}
}
