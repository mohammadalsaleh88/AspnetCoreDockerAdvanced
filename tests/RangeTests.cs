using System;
using System.Linq;
using Xunit;
using api.Controllers;

namespace tests
{
    public class RangeTests
    {
        [Fact]
        public void Test1()
        {
            var range = new api.Controllers.Range { Count = 3 };
            var generated = range.Of(() => "");
            Assert.Equal(3, generated.Count());
        }
    }
}
