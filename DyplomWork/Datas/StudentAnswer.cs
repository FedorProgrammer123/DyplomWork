//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DyplomWork.Datas
{
    using System;
    using System.Collections.Generic;
    
    public partial class StudentAnswer
    {
        public int answerId { get; set; }
        public int resultId { get; set; }
        public int questionId { get; set; }
        public int answerOptionId { get; set; }
    
        public virtual AnswerOption AnswerOption { get; set; }
    }
}