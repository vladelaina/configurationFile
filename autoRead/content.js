// 使用 MutationObserver 来确保我们能够找到元素
function waitForElement(selector) {
    return new Promise(resolve => {
        if (document.querySelector(selector)) {
            return resolve(document.querySelector(selector));
        }

        const observer = new MutationObserver(() => {
            if (document.querySelector(selector)) {
                observer.disconnect();
                resolve(document.querySelector(selector));
            }
        });

        observer.observe(document.body, {
            childList: true,
            subtree: true
        });
    });
}

// 清理文本的函数
function cleanText(text) {
    return text.replace(/[*&#-`]/g, '');
}

// 处理文本更新和播放的函数
async function handleTextUpdate(textInput, stopButton, playButton, newText) {
    // 点击停止按钮
    stopButton.click();
    
    // 等待一小段时间确保停止完成
    await new Promise(resolve => setTimeout(resolve, 500));
    
    // 激活输入框并清空内容
    textInput.focus();
    textInput.value = '';
    
    // 设置新的文本内容
    const cleanedText = cleanText(newText);
    textInput.value = cleanedText;
    
    // 触发必要的事件
    textInput.dispatchEvent(new Event('input', { bubbles: true }));
    textInput.dispatchEvent(new Event('change', { bubbles: true }));
    
    // 等待一小段时间后点击播放按钮
    setTimeout(() => {
        playButton.click();
    }, 1000);
}

let lastClipboardContent = '';

// 定期检查剪贴板内容
async function checkClipboard(textInput, stopButton, playButton) {
    try {
        const newContent = await navigator.clipboard.readText();
        if (newContent !== lastClipboardContent) {
            lastClipboardContent = newContent;
            await handleTextUpdate(textInput, stopButton, playButton, newContent);
        }
    } catch (err) {
        console.error('读取剪贴板失败:', err);
    }
}

// 主函数
async function init() {
    try {
        // 等待所有需要的元素加载
        const [textInput, stopButton, playButton] = await Promise.all([
            waitForElement('textarea.form-control'),
            waitForElement('#stop'),
            waitForElement('#quick-play')
        ]);
        
        // 初始化时先执行一次
        const initialText = await navigator.clipboard.readText();
        lastClipboardContent = initialText;
        await handleTextUpdate(textInput, stopButton, playButton, initialText);
        
        // 设置定期检查剪贴板
        setInterval(() => {
            checkClipboard(textInput, stopButton, playButton);
        }, 1000); // 每秒检查一次剪贴板
        
    } catch (err) {
        console.error('初始化失败:', err);
    }
}

// 确保页面完全加载后再运行
window.addEventListener('load', () => {
    setTimeout(init, 500);
});